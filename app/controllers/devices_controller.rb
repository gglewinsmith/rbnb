class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        devices.name ILIKE :query \
        OR devices.description ILIKE :query \
        OR devices.type_of_device ILIKE :query \
      "
      @devices = Device.where(sql_query, query: "%#{params[:query]}%")
      # @devices = Device.where("type_of_device ILIKE ?", "%#{params[:query]}%")
      @devices = @devices.reject { |d| d.booking_ids.present? }
    else
      @devices = Device.all.reject { |d| d.booking_ids.present? }
    end
    @devices = @devices.reject { |d| d.user == current_user } if current_user
    @devices = [] if @devices.nil?

    @devices_position = Device.where.not(latitude: nil, longitude: nil).reject { |d| d.user == current_user }.reject { |d| d.booking_ids.present? }

    @markers = @devices_position.map do |device|
      {
        lng: device.longitude,
        lat: device.latitude,
        infoWindow: { content: render_to_string(partial: "/shared/map_window", locals: { device: device }) }
      }
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @booking = Booking.new(start_of_renting: Date.today, end_of_renting: Date.today + 7.days)
    set_device
    calculate_total_price
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(set_params)
    @device.user_id = current_user.id
    if @device.save
      redirect_to dashboard_path
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
    redirect_to dashboard_path
  end

  private
  def calculate_total_price
    @price = @device.price_per_week * ((@booking.end_of_renting - @booking.start_of_renting) / 7).floor
  end

  def set_params
    params.require(:device).permit(:name, :price_per_week, :description, :condition_of_device, :age_of_device, :type_of_device, :address, :photo)
  end

  def set_device
    @device = Device.find(params[:id])
  end
end
