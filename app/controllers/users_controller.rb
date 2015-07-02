class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to stocks_path, flash: { success: "Welcome #{current_user.username} your account was successfully created." }
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :location_id, :password, :password_confirmation)
    end

end