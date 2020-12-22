class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :sender
      t.string :receiver
      t.string :status
    end
  end
end
