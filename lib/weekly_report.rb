module WeeklyReport
  class SendMail
    
    def perform
       User.each do |user|
         UserMailer.weekly_report_email(user).deliver_later
       end
    end
  end
end