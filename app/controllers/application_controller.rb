class ApplicationController < ActionController::Base
  protect_from_forgery
  
private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate_user!
    if !current_user
      redirect_to root_path, error: "Please log in to use this app"
    end
  end
  
  helper_method :current_user
end
