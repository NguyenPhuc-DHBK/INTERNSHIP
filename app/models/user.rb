class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :albums
  has_many :photos
  validates :email, :encrypted_password, :firstname, :lastname, presence: true
  validates :firstname, :lastname, length: { maximum: 25 }
  validates :email, length: {maximum: 255}
  validates :email, format: { with: /\A\S+@.+\.\S+\z/, message: "must be email" }
  validates :password, length: { maximum:64 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
