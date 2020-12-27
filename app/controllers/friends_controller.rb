class FriendsController < ApplicationController
  
  get '/friends' do
    if self.logged_in?
      @user = self.current_user
      @all_users = User.all
      @all_friends = Friend.all
      erb :"/pages/friends", :layout => :"/layout/layout"
    else
      redirect "/error/you're currently not logged in"
    end
  end

  get '/friends/search' do
    @user = self.current_user 
    if params.size > 0
      @all_matches = []
      @first_name = @all_matches << User.find_by(first_name: params[:name].split.first.downcase.capitalize)
      @last_name = @all_matches << User.find_by(last_name: params[:name].split.last.downcase.capitalize)
      @all_matches.uniq!
    else 
      redirect '/friends'
    end
    erb :"/pages/friends_search", :layout => :"/layout/layout"
  end
  
end