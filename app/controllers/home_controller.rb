class HomeController < ApplicationController
  get '/home' do
    if self.logged_in?
      @user = self.current_user
      @posts = Post.where(user_id: session[:user_id]).reverse
      @location = CurrentLocation.location_info
      
      erb :"/pages/home", :layout => :"/layout/layout"
    else
      redirect "/error/you're currently not logged in"
    end
  end

  post '/pic' do
    @user = self.current_user
    @user.avatar = params[:avatar]
    @user.save
    redirect "/home"
  end

end