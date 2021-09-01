class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def rated? pin_id
    return false if current_user.nil? || !(Pin.where(user_id: current_user.id).empty?)

    !(Rating.where(user_id: current_user.id, pin_id: pin_id).empty?)
  end
end
