class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_websites
  has_many :websites, through: :collection_websites
  validates :name, presence: true
end
