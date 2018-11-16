class Device < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :price_per_week, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :condition_of_device, presence: true, inclusion: { in: ['Excellent', 'Very Good', 'Good', 'Used'] }
  validates :age_of_device, presence: true
  validates :type_of_device, presence: true
  validates :address, presence: true
  validates :photo, presence: true
end
