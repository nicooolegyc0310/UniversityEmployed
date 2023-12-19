class ApplicationController < ActionController::Base

  include ApplicationHelper

  def index
    @applications = current_user.applications.includes(:opportunity)
    render plain: "No view required for ApplicationController#index"
  end
end
