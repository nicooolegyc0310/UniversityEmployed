class ApplicationController < ActionController::Base

  def index
    @applications = current_user.applications.includes(:opportunity)
  end
end
