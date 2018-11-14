class Device < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :price_per_week, presence: true
  validates :description, presence: true
  validates :condition_of_device, presence: true
  validates :age_of_device, presence: true
  validates :type_of_device, presence: true
  validates :photo, presence: true
end
