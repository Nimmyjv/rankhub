class Invite < ApplicationRecord
    validates :name,:email, presence: true
    
end
