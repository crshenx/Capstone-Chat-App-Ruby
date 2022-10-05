class User < ApplicationRecord
    has_one_attached :picture

    has_many :messages
    has_many :rooms, through: :messages
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    
end
