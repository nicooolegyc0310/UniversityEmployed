# spec/controllers/opportunities_controller_spec.rb
require 'rails_helper'

RSpec.describe OpportunitiesController, type: :controller do
  it 'creates an opportunity' do
    opportunity_params = {
      title: 'Test Opportunity',
      professor_name: 'Test Professor',
      department: 'Test Department',
      description: 'Test Description',
      contact: 'test@example.com',
      requirements: 'Test Requirements',
      duration: 'Test Duration',
      capacity: 5
    }

    post :create, params: { research_opportunity: opportunity_params }
    expect(Opportunity.count).to eq(1)
    expect(flash[:notice]).to include('Test Opportunity')
    expect(response).to redirect_to(opportunities_path)
  end

  it 'edits an opportunity' do
    opportunity = Opportunity.create(title: 'Original Title', professor_name: 'Original Professor')
    new_attributes = { title: 'New Title', professor_name: 'New Professor' }

    put :update, params: { id: opportunity.id, research_opportunity: new_attributes }
    opportunity.reload

    expect(opportunity.title).to eq('New Title')
    expect(opportunity.professor_name).to eq('New Professor')
    expect(flash[:notice]).to include('New Title')
    expect(response).to redirect_to(opportunity_path(opportunity))
  end

  it 'deletes an opportunity' do
    opportunity = Opportunity.create(title: 'Test Opportunity')
    delete :destroy, params: { id: opportunity.id }
    expect(Opportunity.count).to eq(0)
    expect(flash[:notice]).to include('Test Opportunity')
    expect(response).to redirect_to(opportunities_path)
  end
end
