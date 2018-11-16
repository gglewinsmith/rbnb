class BookingsController < ApplicationController
before_action :find, only: [:destroy]
before_action :authenticate_user!


  def total_cost
    stay_length = @booking.end_of_renting - @booking.start_of_renting
    (@booking.device.price_per_week / 7) * stay_length
  end

  def new
    @device = Device.find(params[:device_id])
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.device = Device.find(params[:device_id])
    @booking.user = current_user
    @booking.cost = total_cost
    if @booking.save
      redirect_to dashboard_path
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_of_renting, :end_of_renting, :user_id, :device_id)
  end
end
