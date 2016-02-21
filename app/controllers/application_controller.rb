class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :fill_dev_user
  #before_filter :set_current_user
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      user_path(current_user)
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end



  # def fill_dev_user
  #   return unless Rails.env.development?
  #   @current_user = 3
  #   cookies[:user_id] = @current_user
  # end

  # def set_current_user
  #   @current_user = cookies[:user_id]
  # end

end
