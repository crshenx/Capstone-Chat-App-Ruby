class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :users, through: :messages
    validates_uniqueness_of :name
    scope :public_rooms, -> { where(is_private: false) }
end
