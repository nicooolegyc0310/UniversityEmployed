class SessionsController < ApplicationController
  layout "plain"
  
  def create
    @user = User.find_by(email: params[:email])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.user_type == "student"
        flash[:notice] = "Welcome back student " + @user.firstname
      elsif @user.user_type == "grad_student"
        flash[:notice] = "Welcome back grad student " + @user.firstname
      else
        flash[:notice] = "Welcome back Professor " + @user.firstname
      end
      redirect_to opportunities_path
    else
      message = "Incorrect username or password"
      redirect_to login_path, notice: message
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "You have been logged out."
  end

  def login
    if session[:user_id] != nil
      redirect_to opportunities_path
    end
  end
end
