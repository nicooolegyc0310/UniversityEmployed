# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { "test_user@example.com" }
    password_digest { "password" }
    firstname { "John" }
    lastname { "Smith" }
    user_type { "student" }
  end
end