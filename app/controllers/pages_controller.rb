class PagesController < ApplicationController
  before_action :authenticate_user!, except: :homepage

  def homepage
<<<<<<< HEAD
    @devices = Device.all.reject { |device| device.user_id == current_user.id }
=======
    if current_user
      @devices = Device.all.reject { |device| device.user == current_user }
    else
      @devices = Device.all
    end
>>>>>>> 8d4e9d2c3c923390d10638d188a6d64b433c5949
  end

  def dashboard
    @bookings = Booking.all
    @devices_booked = []
    current_user_id = current_user.id
    @bookings.each do |booking|
      @devices_booked << booking if booking.user_id == current_user_id
    end
  end
end
