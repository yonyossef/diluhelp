module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def current_username
    if session[:user_id]
      @current_username ||= current_user.username
    end
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  def require_admin
      if logged_in? and !current_user.admin?
          flash[:danger] = "פעולה זו מותרת למורשי עריכה בלבד"
          redirect_to :back
      end
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
