# spec/models/application_spec.rb
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

RSpec.describe Application, type: :model do
    describe 'status validation' do
        it 'validates inclusion of status in [pending, approved, rejected] with a custom message' do
          application = Application.new(status: 'invalid_status')
          expect(application.valid?).to be false
          expect(application.errors[:status]).to include("invalid_status is not a valid status")
        end
    end
end
