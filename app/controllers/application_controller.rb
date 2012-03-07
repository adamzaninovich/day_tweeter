class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?
  
  private
  
  def require_user!
    unless signed_in?
      flash[:error] = "Please sign in first"
      redirect_to root_path
    end
  end
  
  def current_user
    if signed_in?
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def signed_in?
    session[:user_id].present?
  end
  
  def sign_in! user
    session[:user_id] = user.id
    @current_user = user
  end
  
  def sign_out!
    session[:user_id] = nil
    @current_user = nil
  end
  
end
