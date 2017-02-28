require 'spec_helper'
require 'rails_helper'

describe WeeklyReportJob, job: true do
  describe "#perform" do
    it "delivers weekly report mail" do
      expect {
        WeeklyReportJob.perform_async
      }.to change{ ActionMailer::Base.deliveries.size }.by(User.count)
    end
  end
end