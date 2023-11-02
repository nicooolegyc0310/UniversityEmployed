class OpportunitiesController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] # retrieve movie ID from URI route
    @opportunity = Opportunity.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # Filter the opportunities by the provided professor's name
    if params[:professor_name]
      @opportunities = Opportunity.where(professor_name: params[:professor_name])
    # Else retrieve all opportunities
    else
      @opportunities = Opportunity.all
    end
  end
  
  def new
    # default: render 'new' template
  end

  def create
    opportunity_params = params.require(:research_opportunity).permit(:title, :professor_name, :department, :description, :contact, :requirements, :duration)

    byebug
    @opportunity = Opportunity.create!(opportunity_params)
    flash[:notice] = "#{@opportunity.title} was successfully created."
    redirect_to opportunities_path
  end

  def edit
    @opportunity = Opportunity.find params[:id]
  end

  def update
    @opportunity = Opportunity.find params[:id]

    opportunity_params = params.require(:research_opportunity).permit(:title, :professor_name, :department, :description, :contact, :requirements, :duration)

    @opportunity.update_attributes!(opportunity_params)
    flash[:notice] = "#{@opportunity.title} was successfully updated."
    redirect_to opportunity(@opportunity)
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.destroy
    flash[:notice] = "Opportunity '#{@opportunity.title}' deleted."
    redirect_to opportunities_path
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:title, :professor_name, :department, :description, :contact, :requirements, :duration, :capacity)
  end
  
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
end
