class AppUsagesController < ApplicationController
  before_filter :authenticate_device
  respond_to :json
  
  def create
    app_usage = AppUsage.new(app_usage_params)
    if app_usage.save
      render json: {}, 
            status: :created
    else
      logger.warn "Error while saving App Usage #{app_usage.errors.full_messages}"
      render json: {}, 
              status: :unprocessable_entity
    end
  end
  private

  def app_usage_params
    params.require(:app_usage).
      permit(:package_name,
            :usage_duration_in_seconds,
            :used_on)
              
  end
end
