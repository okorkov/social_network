class FriendsController < ApplicationController
  
  get '/friends' do
    if self.logged_in?
      @user = self.current_user 
      @friends = @user.friends
      @pending_friendship = @user.pending_friendship
      erb :"/pages/friends", :layout => :"/layout/layout"
    end
  end

  get '/friends/search' do
    if self.logged_in?
      @user = self.current_user 
      @all_matches = Friend.friend_search(params)
      erb :"/pages/friends_search", :layout => :"/layout/layout"
    end
  end

  post '/friends/request' do
    @user = self.current_user
    if @user.id == session[:user_id]
      @sender = User.find(params[:sender_id])
      @receiver = User.find(params[:receiver_id])
      @receiver.senders << @sender
      redirect "/profile/#{params[:receiver_id]}"
    else
      redirect "/error/action not allowed"
    end
  end

  delete '/friends/delete_friend' do
    @user = self.current_user
    if @user.id == session[:user_id]
      Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first.destroy
      Friend.where(sender_id: params[:receiver_id], receiver_id: params[:sender_id]).first.destroy
      redirect "/profile/#{params[:receiver_id]}"
    else
      redirect "/error/action not allowed"
    end
  end

  delete '/friends/delete_request' do
    @user = self.current_user
    if @user.id == session[:user_id]
      Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first.destroy
      redirect "/profile/#{params[:receiver_id]}"
    else
      redirect "/error/action not allowed"
    end
  end

end

