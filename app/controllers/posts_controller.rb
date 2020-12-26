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

  delete '/posts/:id' do
    @posts = Post.where(user_id: params[:id])
    @posts.each {|post| post.destroy}
    redirect '/posts'
  end

  get '/posts/:id/edit' do
    if Post.find_by(id: params[:id]) != nil
      @user = self.current_user
      @post = Post.find_by(id: params[:id])
      if @user.id == @post.user_id
        erb :"/pages/post_edit", :layout => :"/layout/layout"
      else
        redirect "/error/not allowed to edit this post"
      end
    else
      redirect "/error/post with this id doesn't exists"
    end
  end
  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.post_body = "#{params[:post_body]} -(edited)"
    @post.save
    redirect '/posts'
  end

end
