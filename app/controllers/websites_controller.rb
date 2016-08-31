class WebsitesController < ApplicationController

  def create
    @website = Website.new(website_params)
    if @website.save
      redirect_to root_url
    end
  end

  def show
    @alexa_rank =  Website.find(params[:id]).alexaranks.all
  end

  private
    def website_params
      params.require(:website).permit(:url, :user_id)
    end
end
