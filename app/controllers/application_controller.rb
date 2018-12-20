class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate
    redirect_to(login_path) unless !current_user.nil? || params[:guest] == "true"
  end
  
end
