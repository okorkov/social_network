class CreateMessagesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :message
      t.string :when_posted
    end
  end
end
