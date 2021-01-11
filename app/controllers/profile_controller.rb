

class ProfileController < ApplicationController

  get '/profile' do
    @user = self.current_user
    erb :"/pages/profile", :layout => :"/layout/layout"
  end

  get '/profile/:id' do
    id = params[:id]
    if User.find_by(id: id)
      @user = User.find(id)
      @self = self.current_user
      @location = CurrentLocation.location_info
      @posts = Post.where(user_id: id).reverse

      erb :"/pages/home", :layout => :"/layout/layout"
    else
      redirect '/error/there is no user with this id'
    end
  end

  patch '/profile/:id' do
    @user = self.current_user
    if @user.id == session[:user_id]
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
    else 
      redirect "error/can't edit this profile"
    end
  end

  delete '/profile' do
    @user = self.current_user
    if @user.id == session[:user_id]
    User.find_by(id: session[:user_id]).destroy
    redirect "/"
    else
      redirect "/error/can't delete profile that doesn't belongs to you"
    end
  end

  #LIVE CODING SECTION
  #Write a custom route so that when a user visits /profiles/most-popular, the visitor sees the user with the most friends
  #There are several ways to do it, so I'll leave it up to you to
  #HINT Look up the max_by Ruby method to help you find the user with the most friends 

  get '/profiles/most-popular' do
    @users = User.all
    @most_popular_user = @users.max_by {|user| user.friends.length}
    redirect "/profile/#{@most_popular_user.id}"
  end 
  
end

