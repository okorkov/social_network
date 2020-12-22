class HomeController < ApplicationController
  get '/home' do
    erb :"/home/home", :layout => :"/layout/layout"
  end
end