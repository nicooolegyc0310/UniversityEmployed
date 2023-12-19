# spec/factories/opportunities.rb

FactoryBot.define do
    factory :opportunity do
      title { "Distributed Systems and Scalability" }
      professor_name { "Luca Carloni" }
      department { "Computer Science" }
      description { "Participate in cutting-edge lab research to design and test large-scale distributed systems for modern web applications." }
      contact { "luca@cs.columbia.edu" }
      requirements { "Understanding of computer networks, Lab experience with system deployments." }    
      duration { "Winter Semester 2023" }
      capacity { 2 }
    end
  end