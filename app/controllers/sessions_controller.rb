class SessionsController < ApplicationController
  layout "plain"
  
  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to opportunities_path
    else
      message = "Something went wrong"
      redirect_to login_path, notice: message
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "You have been logged out."
  end
end
