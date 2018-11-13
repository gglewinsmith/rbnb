class BookingsController < ApplicationController
before_action :find, only: [ :new, :create, :destroy]

  def new
    @device = Device.find(params[:device_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.device = Device.find(params[:device_id])
    if @booking.save
      redirect_to devices_path
    else
      render :new
    end
  end

  def destroy

  end

  private

  def booking_params
    params.require(:booking).permit(:start_of_renting, :end_of_renting, :user_id, :device_id)
  end

end
