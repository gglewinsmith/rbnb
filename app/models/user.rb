class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :devices
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :photo, presence: true
end
