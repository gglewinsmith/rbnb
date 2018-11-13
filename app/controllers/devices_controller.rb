class DevicesController < ApplicationController
  before_action :find, only: %w[show edit update destroy]

  def index
    @devices = Device.all
  end

  def show
  end

  def new
    @device = Device.new
  end

  def create
    Device.create(set_params)
    redirect_to devices_path
  end

  def edit
  end

  def update
    @device.update(set_params)
    @device.save
    redirect_to devices_path
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  private


  def set_params
    params.require(:device).permit(:name, :price_per_week, :description, :condition_of_device, :age_of_device, :type_of_device, :photo)
  end

  def find
    @device = Device.find(params[:id])
  end

end
