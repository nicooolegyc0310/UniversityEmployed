class UsersController < ApplicationController
  layout "plain"
  before_action :require_login, only: [:index]

  
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to opportunities_path
    end
  end

  def index
    @user_info = User.find(session[:user_id])
    if @user_info.user_type == "professor" || @user_info.user_type == "grad_student"
      @my_opportunities = Opportunity.where(created_by_id: @user_info.id)
    end

    if @user_info.user_type == "student"
      @my_opportunities = Opportunity.joins(:applications)
      .where(applications: { user_id: @user_info.id })
      .distinct
    end

    render layout: "application"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :user_type)
  end

  def require_login
    unless session[:user_id]
      flash[:warning] = "You must be logged in to access this page."
      redirect_to login_path
      return true
    end
    return false
  end
end
