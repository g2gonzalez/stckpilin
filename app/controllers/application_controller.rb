class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # allows us to use @current_user in our view files
  helper_method :current_user

  def authorize
    @user_id = params[:id].to_i
    if @user_id != current_user
      redirect_to login_path, flash: { danger: "Whoa buddy. That page is off limits!" }
    end
  end

end
