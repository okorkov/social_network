class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_body
      t.string :user_id
      t.datetime :when_posted
    end
  end
end
