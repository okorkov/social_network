class PostsController < ApplicationController
  
  get '/posts' do
    @user = self.current_user

    erb :"/pages/posts", :layout => :"/layout/layout"
  end

  post '/posts' do
    Post.create(params)
    redirect '/home'
  end

end
