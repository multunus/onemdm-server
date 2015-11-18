class InstallationsController < ApplicationController
  before_action :authenticate_device
  respond_to :json

  def downloaded
    Installation.find(params[:id]).downloaded!
    render json:{}, status: :ok
  end

  def installed
    Installation.find(params[:id]).installed!
    render json:{}, status: :ok
  end
end
