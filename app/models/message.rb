class Message < ActiveRecord::Base

  belongs_to :User

  def self.chat(message_id)
    @message = Message.find(message_id)
    @all_messages = []
    @sender = Message.where(sender_id: @message.sender_id, receiver_id: @message.receiver_id)
    @receiver = Message.where(sender_id: @message.receiver_id , receiver_id: @message.sender_id)
    @all_messages << @sender
    @all_messages << @receiver
    @all_messages.flatten.sort_by {|message| DateTime.parse(message.when_posted)}
  end
  
end
