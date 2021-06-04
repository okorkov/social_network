ENV["RACK_ENV"] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

configure do
  set :protection, except: [:frame_options]
end

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

configure :production do
  set :database, ENV['DATABASE_URL']
end


require_all 'app'


