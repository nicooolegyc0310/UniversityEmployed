# spec/controllers/application_spec.rb
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

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #index' do
    context 'when the user is logged in' do
      let(:user) { create(:user) }
      let!(:opportunities) { create_list(:opportunity, 3) }
      let!(:applications) { opportunities.map { |opp| create(:application, user: user, opportunity: opp) } }
      
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'responds successfully' do
        get :index
        expect(response).to be_successful
      end
    end
  end
end
