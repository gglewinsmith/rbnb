class PagesController < ApplicationController
  def homepage
    @devices = Device.all
  end

  def dashboard
    @devices = Device.all
  end
end
