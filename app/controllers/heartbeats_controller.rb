class HeartbeatsController < ApplicationController
  before_action :authenticate_device
  respond_to :json
  
  def create
    heartbeat = Heartbeat.create(device: @device)
    render json: { next_heartbeat_time: heartbeat.next_heartbeat_time }, 
      status: :created
  end
end
