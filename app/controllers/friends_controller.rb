class FriendsController < ApplicationController
  
  get '/friends' do
    #current friends
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
    #pending_friend_requests
    @friendship_request = []
    Friend.where(sender_id: @user.id, status: "pending").each {|friend| @friendship_request << friend}
    Friend.where(receiver_id: @user.id, status: "pending").each {|friend| @friendship_request << friend}
    @friends_id_request = []
    @friendship_request.each do |friend| 
      @friends_id_request << friend.sender_id
      @friends_id_request << friend.receiver_id
    end
    @friends_requests = @friends_id_request.map {|id| User.where(id: id) if id != @user.id}

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

  post '/friends/request' do
    Friend.create(params)
    redirect "/profile/#{params[:receiver_id]}"
  end

  post '/friends/accept' do
    @pending_friendship = Friend.where(params).first
    @pending_friendship[:status] = 'friends'
    @pending_friendship.save
    redirect "/profile/#{params[:sender_id]}"
  end

  post '/friends/delete_request' do
    @request_one = Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first
    @request_two = Friend.where(sender_id: params[:receiver_id], receiver_id: params[:sender_id]).first
    @request_one.destroy if !@request_one.nil?
    @request_two.destroy if !@request_two.nil?
    redirect "/profile/#{params[:receiver_id]}" if !@request_one.nil?
    redirect "/profile/#{params[:sender_id]}" if !@request_two.nil?
  end

end

