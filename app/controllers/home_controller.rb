class HomeController < ApplicationController
  get '/home' do
    if self.logged_in?
      @user = self.current_user
      @location = CurrentLocation.location_info
      @posts = Post.where(user_id: session[:user_id]).reverse
      erb :"/pages/home", :layout => :"/layout/layout"
    else
      redirect "/error/you're currently not logged in"
    end
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
end