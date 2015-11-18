class DevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    device = Device.find_or_initialize_by(unique_id: device_params[:unique_id])
    device.assign_attributes(device_params)
    if device.save
      render json: { access_token: device.access_token,
                     next_heartbeat_time: device.next_heartbeat_time
                   }, 
            status: :created
    else
      render json: { error: device.errors.full_messages }, 
              status: :unprocessable_entity
    end
  end

  private

  def device_params
    params.require(:device).permit(:model,
                                   :unique_id, 
                                   :imei_number,
                                   :gcm_token,
                                   :os_version,
                                   :client_version)
  end
end
