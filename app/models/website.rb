class Website < ApplicationRecord
  belongs_to :user
  belongs_to :collections
  has_many  :alexaranks, dependent: :destroy
  validates :url, format: { with: URI.regexp }, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :url, :scope => :user_id
  
  def fetch_alexa_rank_and_update!
    begin
      rank = Alexarank.fetch_rank domain: url.to_s
      self.alexaranks.create(rank: rank)
    rescue Exception => e
      Rails.logger.info "[AFE] #{url.to_s} rank fetch failed."
      Rails.logger.info "[AFE] #{e.message}"
    end
  end
  
  def fetch_last_10_days_rank
    self.alexaranks.where("created_at >= ?",
                          Date.current - 10.days)
                          .order('created_at ASC')
  end
end
