class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    logger.error("after_sign_in_path_for start")
    users_path
  end

  def after_sign_out_path_for(resource)
    logger.error("after_sign_out_path_for start")
    root_path
  end

  def configure_permitted_parameters
    logger.error("configure_permitted_parameters start")
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
