class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def hello
    render html: 'Hello'
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @_request.reset_session
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] ="You must be logged in for this action!"
      redirect_to login_path
    end
  end

end
