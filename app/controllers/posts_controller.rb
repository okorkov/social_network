class PostsController < ApplicationController
  
  get '/posts' do
    if self.logged_in?
      @user = self.current_user
      @posts = Post.where(user_id: session[:user_id]).reverse
      erb :"/pages/posts", :layout => :"/layout/layout"
    else
      redirect "/error/you're currently not logged in"
    end
  end

  post '/posts' do
    @user = self.current_user
    if @user.id == session[:user_id]
      Post.create(params)
      redirect '/home'
    else
      redirect "/error/this post doesn't belongs to you"
    end
  end

  post '/posts_page' do
    @user = self.current_user
    if @user.id == session[:user_id]
      Post.create(params)
      redirect '/posts'
    else
      redirect "/error/this post doesn't belongs to you"
    end
  end

  delete '/posts' do
    @user = self.current_user
    if @user.id == session[:user_id]
      @posts = Post.where(user_id: params[:id])
      @posts.each {|post| post.destroy}
      redirect '/posts'
    else
      redirect "/error/this post doesn't belongs to you"
    end
  end

  delete '/posts/:id' do
    @user = self.current_user
    if @user.id == session[:user_id]
      @post = Post.find(params[:id])
      @post.destroy
      redirect '/posts'
    else
      redirect "/error/this post doesn't belongs to you"
    end
  end

  get '/posts/:id/edit' do
    if Post.find_by(id: params[:id]) != nil
      if self.logged_in?
        @user = self.current_user
        @post = Post.find_by(id: params[:id])
        if @user.id == @post.user_id
          erb :"/pages/post_edit", :layout => :"/layout/layout"
        else
          redirect "/error/not allowed to edit this post"
        end
      else
        redirect "/error/you're currently not logged in"
      end
    else
        redirect "/error/post with this id doesn't exists"
    end
  end

  patch '/posts/:id' do
    @user = self.current_user
    if @user.id == session[:user_id]
      @post = Post.find_by(id: params[:id])
      @post.post_body = "#{params[:post_body]} -(edited)"
      @post.save
      redirect '/posts'
    else
      redirect "/error/this post doesn't belongs to you"
    end
  end

end
