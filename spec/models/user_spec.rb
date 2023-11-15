require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a student' do
    student = User.create(email: 'test_user', firstname: "John", lastname: "Smith", password: 'password', user_type: 'student')
    expect(student).to be_valid
    expect(student.user_type).to eq('student')
  end

  it 'creates a professor' do
    professor = User.create(email: 'test_user', firstname: "John", lastname: "Smith", password: 'password', user_type: 'professor')
    expect(professor).to be_valid
    expect(professor.user_type).to eq('professor')
  end
end
