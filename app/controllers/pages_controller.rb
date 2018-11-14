class PagesController < ApplicationController
  before_action :authenticate_user!, except: :homepage

  def homepage
    @devices = Device.all.reject { |device| device.user.id == current_user.id }
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
