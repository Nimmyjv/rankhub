class WeeklyReportJob
  include SuckerPunch::Job
  def perform
    User.all.each do |user|
      UserMailer.weekly_report_email(user).deliver_later
    end
  end
    
end