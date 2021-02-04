ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


task :console do
  Pry.start
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
    dob: random_user['results'][0]['dob']['date'].split('T')[0],
    avatar: random_user['results'][0]['picture']['large']
    }
    User.create(hash)
    counter += 1
  end
end


task :random_post do
  random_post = CurrentLocation.random_post #  {"text"=>"We can only learn to love by loving.", "author"=>"Iris Murdoch"},
  counter = 1
  while counter < random_post.length
    random_user_id = rand(1..1000) #change
    hash = { 
      post_body: random_post[counter]["text"],
      user_id: random_user_id,
      when_posted: Time.now
     }
    Post.create(hash)
    counter +=1
  end
end



