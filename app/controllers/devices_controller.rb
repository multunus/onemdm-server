class DevicesController < ApplicationController
  respond_to :json

  def create
    device = Device.create(device_params)
    respond_with device, status: :created
  end

  private

  def device_params
    params.require(:device).permit(:model, :unique_id, :imei_number)
  end
end
