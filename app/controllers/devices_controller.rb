class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @devices = Device.all
    @device = Device.new
  end

  def show
    set_device
  end

  def new
    @device = Device.new
  end

  def create
    @user = current_user
    @device = Device.new(set_params)
    @device.user_id = @user.id
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
    @device.destroy
    redirect_to devices_path
  end

  private

  def set_params
    params.require(:device).permit(:name, :price_per_week, :description, :condition_of_device, :age_of_device, :type_of_device, :photo)
  end

  def set_device
    @device = Device.find(params[:id])
  end
end
