# lib/tasks/clear_users.rake

namespace :db do
    desc "Clear the users table"
    task clear_users: :environment do
      puts "Clearing the users table..."
      User.delete_all
      puts "Users table cleared."
    end
  end