class Website < ApplicationRecord
  has_many :collection_websites
  has_many :collections, through: :collection_websites
  has_many  :alexaranks, dependent: :destroy
  validates :url, presence: true
  validates_uniqueness_of :url

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
