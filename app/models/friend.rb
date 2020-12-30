class Friend < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def self.friend_search(params)
    @matches = []
    @matches << User.where(first_name: params[:name].split.first.downcase.capitalize)
    @matches << User.where(last_name: params[:name].split.last.downcase.capitalize) 
    @matches.flatten.uniq
  end

end
