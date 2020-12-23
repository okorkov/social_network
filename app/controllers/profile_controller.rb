class ProfileController < ApplicationController

  get '/profile' do
    @user = self.current_user
    erb :"/pages/profile", :layout => :"/layout/layout"
  end

  post '/profile/:id' do
    @user = self.current_user
    # @user.title = params[:title]
    # @user.content = params[:content]
    # @user.save
    redirect "/home/"
  end
  
end