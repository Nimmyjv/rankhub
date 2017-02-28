namespace :weekly do
  desc "Send weekly reports"
  task init: :environment do
    WeeklyReport::SendMail.perform_later
  end
end

