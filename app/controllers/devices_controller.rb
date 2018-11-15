class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if current_user
      @non_user_devices = Device.all.reject { |device| device.user == current_user }
      @non_user_devices.each do |non_user_device|
        if non_user_device.booking_ids.present?
          @devices = []
          @devices << @non_user_devices.delete(non_user_device)
        else
          @devices = Device.all
        end
      end
    else
      @devices = Device.all
    end

    if params[:query].present?
      @devices_to_show = Device.where("type_of_device ILIKE ?", "%#{params[:query]}%")
    else
      @devices_to_show = Device.all
    end
    @devices_position = Device.where.not(latitude: nil, longitude: nil)

    @markers = @devices_position.map do |device|
      {
        lng: device.longitude,
        lat: device.latitude,
        infoWindow: { content: render_to_string(partial: "/shared/map_window", locals: { device: device }) }
      }
    end
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
