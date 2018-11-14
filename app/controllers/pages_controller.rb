class PagesController < ApplicationController
  before_action :authenticate_user!, except: :homepage

  def homepage
    @devices = Device.all.reject { |device| device.user == current_user }
    if current_user
      @devices = Device.all.reject { |device| device.user == current_user }
    else
      @devices = Device.all
    end
  end

  def dashboard
    @booked_devices = Booking.all.select { |booking| booking.user == current_user }
    @lent_devices = Booking.all.select { |booking| booking.device.user == current_user }
  end
end
