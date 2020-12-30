class User < ActiveRecord::Base
  has_many :posts

  has_many :accepted_friends, foreign_key: :sender_id, class_name: 'Friend'
  has_many :receivers, through: :accepted_friends
  
  has_many :requested_friends, foreign_key: :receiver_id, class_name: 'Friend'
  has_many :senders, through: :requested_friends

  has_secure_password

  def friends
    @friends = []
    @friendship = [self.senders, self.receivers]
    @friendship.first.each do |friend|
      @friends << friend if @friendship.last.include?(friend)
    end
    @friends
  end

  def pending_friendship
    @requests = {incoming: [], outgoing: []}
    @friendship = [self.senders, self.receivers]
    @friendship.first.each do |request|
      @requests[:incoming] << request if !@friendship.last.include?(request)
    end
    @friendship.last.each do |request|
      @requests[:outgoing] << request if !@friendship.first.include?(request)
    end
    @requests
  end
end

