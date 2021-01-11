class MessageController < ApplicationController


  post '/message' do
    @user = self.current_user
    if @user.id == session[:user_id]
      @chat = Message.where(params).first
      if !@chat.nil?
      redirect "/messages/#{@chat.id}"
      else
        @new_message = Message.new(params)
        @new_message.when_posted = Time.now
        @new_message.message = "*opened chat with you*"
        @new_message.save
        redirect "/messages/#{@new_message.id}"
      end
    else
      redirect "/error/can't send message to this user"
    end
  end

  post '/message/new' do
    @user = self.current_user
    if @user.id == session[:user_id]
      Message.create(params)
      redirect "/messages/#{Message.where(params).first.id}"
    else
      redirect "/error/can't send message to this user"
    end
  end

  get '/messages/:id' do
    @chat = Message.chat(params[:id])
    @self = self.current_user
    if User.find(@chat.first.sender_id) == @self
      @user = User.find(@chat.first.receiver_id)
    else
      @user = User.find(@chat.first.sender_id)
    end
    erb :"/pages/messages", :layout => :"/layout/layout"
  end

end