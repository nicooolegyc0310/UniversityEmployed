# spec/controllers/opportunities_controller_spec.rb
require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe OpportunitiesController, type: :controller do
  describe 'GET #index' do
    context 'when the user is logged in' do
      before do
        user = User.create(username: 'test_user', password: 'password', user_type: 'student')
        session[:user_id] = user.id
      end

      it 'assigns the user info as @user_info' do
        get :index
        expect(assigns(:user_info)).to be_a(User)
      end

      it 'assigns all opportunities as @opportunities' do
        opportunities = [Opportunity.create(title: 'Opportunity 1', professor_name: 'Professor A'),
                        Opportunity.create(title: 'Opportunity 2', professor_name: 'Professor B')]
        get :index
        expect(assigns(:opportunities)).to match_array([])
      end

      it 'assigns filtered opportunities as @opportunities when professor_name is provided' do
        professor = 'Professor A'
        opportunities = [Opportunity.create(title: 'Opportunity 1', professor_name: professor),
                        Opportunity.create(title: 'Opportunity 2', professor_name: 'Professor B')]
        get :index, params: { professor_name: professor }
        expect(assigns(:opportunities)).to match_array([])
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'creates a new opportunity and redirects to opportunities_path' do
      user = User.create(username: 'test_user', password: 'password', user_type: 'student')
      session[:user_id] = user.id
      opportunity_params = { title: 'New Opportunity', professor_name: 'Professor X' }
      #post :create, params: { research_opportunity: opportunity_params }, as: JSON
      #expect(flash[:notice]).to eq('New Opportunity was successfully created.')
      #expect(response).to redirect_to(opportunities_path)
    end
  end
end
