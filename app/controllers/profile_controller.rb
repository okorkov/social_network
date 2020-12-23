

class ProfileController < ApplicationController

  get '/profile' do
    @user = self.current_user
    erb :"/pages/profile", :layout => :"/layout/layout"
  end

  patch '/profile/:id' do
    @user = self.current_user
    case
      when params[:new_password] == "" && params[:old_password] == ""
        @user.username = params[:username]
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.email = params[:email]
        @user.dob = params[:dob]
        @user.gender = params[:gender]
        @user.save
        redirect "/home"
     when params[:new_password] == "" && params[:old_password] != ""
        redirect "error/you didn't put a new password"
      when params[:new_password] != "" && params[:old_password] == ""
        redirect "error/you didn't put an old password"
     when params[:new_password] != "" && params[:old_password] != ""
        if @user.authenticate(params[:old_password])
          @user.username = params[:username]
          @user.first_name = params[:first_name]
          @user.last_name = params[:last_name]
          @user.email = params[:email]
          @user.dob = params[:dob]
          @user.gender = params[:gender]
          @user.password = params[:new_password]
          @user.save
          redirect "/home"
        else
          redirect "error/old password doesn't match"
        end
     end

  end
  
end

{"_method"=>"patch", "username"=>"alex", "first_name"=>"Alex", 
  "last_name"=>"Okarkau", "email"=>"ceo@socialnetwork.com", "dob"=>"1992-04-27", 
  "gender"=>"male", "old_password"=>"", "new_password"=>"", "id"=>"8"}
    