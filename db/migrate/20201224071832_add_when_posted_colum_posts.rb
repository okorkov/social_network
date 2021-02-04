class AddWhenPostedColumPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :when_posted, :string
  end
end
