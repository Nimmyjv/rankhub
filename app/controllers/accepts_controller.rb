class AcceptsController < ApplicationController

  def create
  
  end
  
  def mail
    @invite = Invite.new(invite_params) 
    @id = Invite.where(:email => invite_params[:email]).select(:id)
    # @uid = @id. 
    @user_email = @email
    hash = Digest::SHA512.hexdigest("#{@user_email}")
    @str=(0...4).map { ('a'..'z').to_a[rand(26)] }.join
    if UserMailer.invite_email(@invite,@str,hash).deliver_now
      Invite.where(id: @id).update_all(accept: "false")

      @accept = Statistic.pluck(:accepted_requests)
      @accept = @accept.map!{ |s| s.to_i + 1 }
      if Statistic.exists?
        Statistic.update(accepted_requests: @accept.last) 
      else
        Statistic.create(accepted_requests: @accept.last) 
      end
    end
    redirect_to admin_statistics_path
  end
    private
  def invite_params
    params.require(:invite).permit(:name, :email)
  end

end







