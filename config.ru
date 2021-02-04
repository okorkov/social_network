require './config/environment'


use Rack::MethodOverride

use FriendsController
use PostsController
use ProfileController
use HomeController
use MessageController

run ApplicationController
