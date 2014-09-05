class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if session[:customer_id]
      @current_user ||= Customer.find(session[:customer_id])
    elsif 
      @current_user ||= Restaurant.find(session[:restaurant_id])
    else
    end
  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in to complete this action."
      redirect_to new_session_path
    end
  end
end
