class User < ActiveRecord::Base
  has_many :posts

  has_many :accepted_friends, foreign_key: :sender_id, class_name: 'Friend'
  has_many :receivers, through: :accepted_friends
  
  has_many :requested_friends, foreign_key: :receiver_id, class_name: 'Friend'
  has_many :senders, through: :requested_friends

  has_secure_password
end


