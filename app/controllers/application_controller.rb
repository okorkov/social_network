require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :login
  end

  post '/login' do
    puts params
    "redirect"
  end

  post '/signup' do
    puts params
    "redirect"
  end


end


