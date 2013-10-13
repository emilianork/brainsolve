class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_role
  
  def current_role
    if current_user.nil? then
      @current_role = nil
    else
      @current_role ||= current_user.role
    end
    return @current_role
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password,:password_confirmation,
      :nickname, :first_name,:second_name, :third_name, :role, :telephone) }
  end
end
