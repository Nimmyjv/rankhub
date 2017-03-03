class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      UserMailer.feedback_email(@feedback).deliver_now
      redirect_to root_path
    end
  end

  private
  
  def feedback_params
      params.require(:feedback).permit(:name, :email, :message)
  end
end
