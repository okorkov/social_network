require './config/environment'
require './app'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use FriendsController
use PostsController
use ProfileController
use HomeController
use MessageController

run ApplicationController
