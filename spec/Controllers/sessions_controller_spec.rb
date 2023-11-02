require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'logs in a user' do
    user = User.create(username: 'test_user', password: 'password', user_type: 'student')
    post :create, params: { username: 'test_user', password: 'password' }
    expect(session[:user_id]).to eq(user.id)
    expect(response).to redirect_to(opportunities_path)
  end

  it 'logs out a user' do
    user = User.create(username: 'test_user', password: 'password', user_type: 'student')
    session[:user_id] = user.id
    post :destroy
    expect(session[:user_id]).to be_nil
    expect(response).to redirect_to(root_path)
  end
end
