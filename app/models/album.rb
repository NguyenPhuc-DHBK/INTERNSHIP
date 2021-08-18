class Album < ApplicationRecord
    has_many :photos
    belongs_to :user
    validates :title, :description, :mode, presence: true
    validates :title, length: { maximum: 140 }
    validates :description, length: { maximum: 300 }
    enum mode: [:public_mode, :private_mode] 

end
