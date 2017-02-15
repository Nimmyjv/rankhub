class WebsitesController < ApplicationController

  def create
    @website = current_user.websites.build(website_params)
    if @website.save
      @sites_count=Website.count('id')
      @each_user_sites=current_user.websites.count

      if User.exists?
        current_user.update(sites_number: @each_user_sites)
      else
        current_user.create(sites_number: @each_user_sites)
      end
      if Statistic.exists?
        Statistic.update(sites: @sites_count) 
      else
        Statistic.create(sites: @sites_count)
      end
    end
    FetchRankJob.perform_later(@website) 
    redirect_to root_url
  end

  def show
    website          = Website.find(params[:id])
    @alexa_rank_json = WebsitesHelper.createJSON(website)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Website.destroy(params[:id])
    redirect_to root_url
  end

  private
    def website_params
      params.require(:website).permit(:url, :user_id, :collection_id)
    end
  
end
