class Photo < ApplicationRecord
    mount_uploader :image, PhotosUploader
    belongs_to :album, optional: true
    belongs_to :user
    validates :title, :description, :mode, :image, presence: true
    validates :title, length: { maximum: 140 }
    validates :description, length: { maximum: 300 }
    enum mode: [:public_mode, :private_mode] 
end
