class OpportunitiesController < ApplicationController
  before_action :force_index_redirect, only: [:index]
  before_action :require_login, only: [:edit, :update, :show, :destroy, :create, :index, :new, :apply]


  def show
    id = params[:id] 
    @opportunity = Opportunity.find(id)
    @user_info = User.find session[:user_id]
    @is_mine = @opportunity.created_by_id == @user_info.id
  end

  def index
    @user_info = User.find session[:user_id]
    # Filter the opportunities by the provided professor's name
    if params[:professor_name]
      @opportunities = Opportunity.where("lower(professor_name) LIKE ?", "%#{params[:professor_name].downcase}%")
      # Else retrieve all opportunities
    else
      @opportunities = Opportunity.all
    end
  end
  
  def new
    # default: render 'new' template
  end

  def create
    opportunity_params = params.require(:research_opportunity).permit(:title, :department, :description, :requirements, :duration, :capacity)
    @user_info = User.find session[:user_id]
    opportunity_params[:created_by_id] = @user_info.id
    opportunity_params[:professor_name] = @user_info.firstname + " " + @user_info.lastname
    opportunity_params[:contact] = @user_info.email

    @opportunity = Opportunity.create!(opportunity_params)
    flash[:notice] = "#{@opportunity.title} was successfully created."
    redirect_to opportunities_path
  end

  def edit
    @opportunity = Opportunity.find params[:id]
    @user_info = User.find session[:user_id]

    if @user_info.id != @opportunity.created_by_id
      flash[:warning] = "Can't edit opportunity you didn't create."
      redirect_to opportunities_path
    end
  end

  def update
    @opportunity = Opportunity.find params[:id]
    @user_info = User.find session[:user_id]

    opportunity_params = params.require(:research_opportunity).permit(:title, :department, :description, :requirements, :duration, :capacity)
    @opportunity.update_attributes!(opportunity_params)
    flash[:notice] = "#{@opportunity.title} was successfully updated."
    redirect_to opportunity_path(@opportunity)

  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @user_info = User.find session[:user_id]
    if @user_info.id == @opportunity.created_by_id
      @opportunity.destroy
      flash[:notice] = "Opportunity '#{@opportunity.title}' deleted."
      redirect_to opportunities_path
    else
      flash[:warning] = "Can't delete opportunity you didn't create."
      redirect_to opportunities_path
    end
  end

  def apply
    @opportunity = Opportunity.find(params[:id])
    @user_info = User.find session[:user_id]

    # Check if the user has already applied to this opportunity
    if @opportunity.applications.where(user_id: @user_info.id).exists?
      flash[:notice] = "You have already applied to this opportunity."
    else
      # Create a new application record
      @application = @opportunity.applications.build(user_id: @user_info.id, status: 'pending')

      if @application.save
        @opportunity.increment!(:applied_users)
        flash[:success] = "Application submitted."
      end
    end

    redirect_to opportunities_path
  end


  private
  
  def force_index_redirect
    #if !params.key?(:ratings) || !params.key?(:sort_by)
    #  flash.keep
    #  url = movies_path(sort_by: sort_by, ratings: ratings_hash)
    #  redirect_to url
    #end
  end

  #def ratings_list
  #  params[:ratings]&.keys || session[:ratings] || Movie.all_ratings
  #end

  #def ratings_hash
  #  Hash[ratings_list.collect { |item| [item, "1"] }]
  #end

  #def sort_by
  #  params[:sort_by] || session[:sort_by] || 'id'
  #end

  def require_login
    unless session[:user_id]
      flash[:warning] = "You must be logged in to access this page."
      redirect_to login_path
      return true
    end
    return false
  end
end
