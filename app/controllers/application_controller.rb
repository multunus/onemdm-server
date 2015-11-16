class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_device
    authenticate_with_token || render_unauthorized
  end

  def authenticate_device
    authenticate_or_request_with_http_token do |token, options|
      @device = Device.find_by(access_token: token)
      @device != nil
    end
  end

  def render_unauthorized
    render json: "Bad token", status: :unauthorised
  end

  def set_timezone_for_admin
    Time.zone = "Mumbai"
  end
end
