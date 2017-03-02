class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable
  has_many :collections
  has_many :websites, through: :collections
  validates_uniqueness_of :token, allow_nil: true
end
