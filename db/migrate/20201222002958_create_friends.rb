class CreateFriends < ActiveRecord::Migration[4.2]
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status
    end
  end
end
