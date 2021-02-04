source 'http://rubygems.org'

ruby '2.7.2'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'bcrypt'
gem 'tux'
gem 'dotenv'
gem 'json'
gem 'uri'
gem 'openssl'
gem 'net-http'
gem 'webpacker'
gem 'securerandom'

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :production do
  gem 'pg'
  gem 'rack-ssl-enforcer'
end
