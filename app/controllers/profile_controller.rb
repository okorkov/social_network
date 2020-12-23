

class ProfileController < ApplicationController

  get '/profile' do
    @user = self.current_user
    erb :"/pages/profile", :layout => :"/layout/layout"
  end

  get '/profile/:id' do
    id = params[:id]
    if User.find_by(id: id)
      @user = User.find(id)
      @location = CurrentLocation.location_info
      @posts = Post.where(user_id: id).reverse
      erb :"/pages/home", :layout => :"/layout/layout"
    else
      redirect '/error/there is no user with this id'
    end
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
