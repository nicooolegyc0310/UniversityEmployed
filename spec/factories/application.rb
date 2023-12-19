# spec/factories/application.rb

FactoryBot.define do
  factory :application do
    association :user
    association :opportunity
    status { "pending" } 
  end
end
