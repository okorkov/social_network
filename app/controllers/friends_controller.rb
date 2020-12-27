class FriendsController < ApplicationController
  
  get '/friends' do
    if self.logged_in?
      @user = self.current_user
      @all_users = User.all
      @friendship = []
      Friend.where(sender_id: @user.id, status: "friends").each {|friend| @friendship << friend}
      Friend.where(receiver_id: @user.id, status: "friends").each {|friend| @friendship << friend}
      @friends_id = []
      @friendship.each do |friend| 
        @friends_id << friend.sender_id
        @friends_id << friend.receiver_id
      end
      @friends = @friends_id.map {|id| User.where(id: id) if id != @user.id}
      
      erb :"/pages/friends", :layout => :"/layout/layout"
    else
      redirect "/error/you're currently not logged in"
    end
  end
  
  get '/friends/search' do
    @user = self.current_user 
    if params.size > 0
      @matches = []
      @matches << User.where(first_name: params[:name].split.first.downcase.capitalize)
      @matches << User.where(last_name: params[:name].split.last.downcase.capitalize) 
      @all_matches = @matches.flatten.uniq
    else 
      redirect '/friends'
    end
    erb :"/pages/friends_search", :layout => :"/layout/layout"
  end
  
end

