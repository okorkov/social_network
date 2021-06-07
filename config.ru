require './config/environment'


use Rack::MethodOverride

use FriendsController
use PostsController
use ProfileController
use HomeController
use MessageController

run ApplicationController

module Rack
  module Protection
    class FrameOptions < Base
      def call(env)
        status, headers, body = @app.call(env)
        [status, headers, body]
      end
    end
  end
end

require 'rack/iframe'
use Rack::Iframe