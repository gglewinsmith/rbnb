class User < ApplicationRecord
  has_many :devices
  has_many :bookings
end
