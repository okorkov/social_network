ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


task :console do
  Pry.start
end

task :add_user do
  random_user = CurrentLocation.seed_user
  hash = { 
    gender: random_user['results'][0]['gender'],
    first_name: random_user['results'][0]['name']['first'],
    last_name: random_user['results'][0]['name']['last'],
    email: random_user['results'][0]['email'],
    username: random_user['results'][0]['login']['username'],
    password: random_user['results'][0]['login']['password'],
    dob: random_user['results'][0]['dob']['date'].split('T')[0]
   }
   User.create(hash)
end

task :add_10_users do
  counter = 1
  while counter <= 10
    random_user = CurrentLocation.seed_user
    hash = { 
    gender: random_user['results'][0]['gender'],
    first_name: random_user['results'][0]['name']['first'],
    last_name: random_user['results'][0]['name']['last'],
    email: random_user['results'][0]['email'],
    username: random_user['results'][0]['login']['username'],
    password: random_user['results'][0]['login']['password'],
    dob: random_user['results'][0]['dob']['date'].split('T')[0]
    }
    User.create(hash)
    counter += 1
  end
end

task :add_50_users do
  counter = 1
  while counter <= 50
    random_user = CurrentLocation.seed_user
    hash = { 
    gender: random_user['results'][0]['gender'],
    first_name: random_user['results'][0]['name']['first'],
    last_name: random_user['results'][0]['name']['last'],
    email: random_user['results'][0]['email'],
    username: random_user['results'][0]['login']['username'],
    password: random_user['results'][0]['login']['password'],
    dob: random_user['results'][0]['dob']['date'].split('T')[0]
    }
    User.create(hash)
    counter += 1
  end
end