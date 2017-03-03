class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable
  has_many :collections
  has_many :websites, through: :collections, autosave: :false
  validates_uniqueness_of :token
end
