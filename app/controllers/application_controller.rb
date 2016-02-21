class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :fill_dev_user
  before_filter :set_current_user
  

  def fill_dev_user
    return unless Rails.env.development?
    @current_user = 3
    cookies[:user_id] = @current_user
  end

  def set_current_user
    @current_user = cookies[:user_id]
  end

end
