source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.11'


gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'

gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'simplecov'
end

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'shoulda-matchers', '~> 4.0'
  gem 'factory_bot_rails'
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'

  gem 'pry'
  gem 'pry-byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
end

group :production do
  gem 'pg', '~> 0.2'
  gem 'rails_12factor'
end