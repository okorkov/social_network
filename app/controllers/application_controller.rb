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
    if User.find_by(username: params[:username]) != nil
      redirect '/error/this user name already exists'
    end
    if User.find_by(email: params[:email]) != nil
      redirect '/error/this email already been used'
    end
      @user = User.new(params)
      if @user.save
        redirect "/home"
      else
        redirect "/error/we weren't able to register you"
      end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
  
  get '/error/:err' do
    @message = params[:err]
    erb :login_signup_error
  end

end


# "username"=>"okorkov", "email"=>"ceo@socialnetwork.com", "password"=>"1827qaws", 
# "first_name"=>"alex", "last_name"=>"Okarkau", "birthday"=>"1992-04-27"}
#<Rack::Session::Abstract::PersistedSecure::SecureSessionHash:0x00007fb3012a1ff0>