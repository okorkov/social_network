class User < ActiveRecord::Base
  has_many :posts
  belongs_to :friend
  has_secure_password
end
