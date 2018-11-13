class BookingsController < ApplicationController
before_action :find, only: %w[show edit update destroy]

  def index
    @booking = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    raise
    # @booking = Booking.last
    @booking = Booking.new(set_params)
    @booking.user = current_user

    if @device.save
      redirect_to devices_path
    else
      render :new
    end
  end

end
