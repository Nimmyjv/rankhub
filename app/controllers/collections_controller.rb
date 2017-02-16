class CollectionsController < ApplicationController
  
  protect_from_forgery 
  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      @list_count=Collection.count('id')
      @each_user_lists=current_user.collections.count
      if User.exists?
        current_user.update(lists_number: @each_user_lists)
      else
        current_user.create(lists_number: @each_user_lists)
      end
      if Statistic.exists?
        Statistic.update(lists: @list_count) 
      else
        Statistic.create(lists: @list_count)
      end
    end
    last_id = Collection.maximum('id')
    @domains = Website.where(:user_id => current_user)
    @domains.where("collection_id IS ?", nil).update( collection_id: last_id )
    redirect_to root_url
  end
  def collection

  end
 
  def show
 
  end

  def destroy

    if Collection.destroy(params[:id])
        @list_count=Collection.count('id')
        @each_user_lists=current_user.collections.count
        if User.exists?
          current_user.update(lists_number: @each_user_lists)
        else
          current_user.create(lists_number: @each_user_lists)
        end
        if Statistic.exists?
          Statistic.update(lists: @list_count) 
        else
          Statistic.create(lists: @list_count)
        end
    Website.where(:collection_id => params[:id]).destroy_all
    redirect_to root_url
   end
  end

  
  private
    def collection_params
      params.require(:collection).permit(:name, :user_id)
    end

end