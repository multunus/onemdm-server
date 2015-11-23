class AppsController  < ApplicationController
  before_action :authenticate_device

  def index
    render json: App.all
  end
end
