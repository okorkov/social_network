class FriendsController < ApplicationController
  
  get '/friends' do
    @user = self.current_user 
    @friends = @user.friends
    @pending_friendship = @user.pending_friendship
    erb :"/pages/friends", :layout => :"/layout/layout"
  end

  get '/friends/search' do
    @user = self.current_user 
    @all_matches = Friend.friend_search(params)
    erb :"/pages/friends_search", :layout => :"/layout/layout"
  end

  post '/friends/request' do
    @sender = User.find(params[:sender_id])
    @receiver = User.find(params[:receiver_id])
    @receiver.senders << @sender
    redirect "/profile/#{params[:receiver_id]}"
  end

  delete '/friends/delete_friend' do
    Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first.destroy
    Friend.where(sender_id: params[:receiver_id], receiver_id: params[:sender_id]).first.destroy
    redirect "/profile/#{params[:receiver_id]}"
  end

  delete '/friends/delete_request' do
    Friend.where(sender_id: params[:sender_id], receiver_id: params[:receiver_id]).first.destroy
    redirect "/profile/#{params[:receiver_id]}"
  end

end

