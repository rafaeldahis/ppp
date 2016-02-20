class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_current_user
  before_filter :fill_dev_user

  def fill_dev_user
    return unless Rails.env.development?
    @current_user ||= params[:user_id] || cookies[:user_id] || "3"
    cookies[:user_id] = @current_user
  end

    def set_current_user
    model_user = @current_user ? User.find_or_create_by(user_id: @current_user.id) : nil
    @current_user = model_user
  end

end
