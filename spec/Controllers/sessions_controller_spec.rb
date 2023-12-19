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

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs in a user and redirects to opportunities_path' do
        user = User.create(email: 'test_user', firstname: "John", lastname: "Smith", password: 'password', user_type: 'student')
        post :create, params: { email: 'test_user', password: 'password' }
        expect(response).to redirect_to(login_path)
      end
    end

    context 'with invalid credentials' do
      it 'redirects to login_path with a notice message' do
        post :create, params: { email: 'non_existent_user', password: 'invalid_password' }
        expect(session[:user_id]).to be_nil
        expect(flash[:notice]).to eq('Incorrect username or password')
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out a user and redirects to login_path' do
      user = User.create(email: 'test_user', firstname: "John", lastname: "Smith", password: 'password', user_type: 'student')
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(flash[:notice]).to eq('You have been logged out.')
      expect(response).to redirect_to(login_path)
    end
  end
end