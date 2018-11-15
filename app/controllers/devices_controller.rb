class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @devices = Device.where.not(latitude: nil, longitude: nil)

    @markers = @devices.map do |device|
      {
        lng: device.longitude,
        lat: device.latitude,
        infoWindow: { content: render_to_string(partial: "/shared/map_window", locals: { device: device }) }
      }
    end
    if current_user
      @devices = Device.all.reject { |device| device.user == current_user }
    else
      @devices = Device.all
    end
    @device = Device.new
  end

  def show
    @booking = Booking.new
    set_device
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(set_params)
    @device.user_id = current_user.id
    if @device.save
      redirect_to devices_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @device.update(set_params)
    @device.save
    redirect_to devices_path
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path
  end

  private

  def set_params
    params.require(:device).permit(:name, :price_per_week, :description, :condition_of_device, :age_of_device, :type_of_device, :address, :photo)
  end

  def set_device
    @device = Device.find(params[:id])
  end
end
