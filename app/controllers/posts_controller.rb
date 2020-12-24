class PostsController < ApplicationController
  
  get '/posts' do
    @user = self.current_user
    @posts = Post.where(user_id: session[:user_id]).reverse
    erb :"/pages/posts", :layout => :"/layout/layout"
  end

  post '/posts' do
    Post.create(params)
    redirect '/home'
  end

  post '/posts_page' do
    Post.create(params)
    redirect '/posts'
  end

  get '/posts/:id' do

  end

end
