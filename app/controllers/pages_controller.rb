class PagesController < ApplicationController
  def homepage
    @devices = Device.all.reject { |device| device.user.id == current_user.id }
  end

  def dashboard
    @devices = Device.all
  end
end
