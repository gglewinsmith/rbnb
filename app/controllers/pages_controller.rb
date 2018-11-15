class PagesController < ApplicationController
  before_action :authenticate_user!, except: :homepage

  def homepage
    @devices = Device.all.last(3)
  end

  def dashboard
    @booked_devices = Booking.all.select { |booking| booking.user == current_user }
    @lent_devices = Booking.all.select { |booking| booking.device.user == current_user }
  end
end
