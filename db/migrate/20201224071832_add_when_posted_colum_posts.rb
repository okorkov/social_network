class AddWhenPostedColumPosts < ActiveRecord::Migration
  def change
    add_column :posts, :when_posted, :string
  end
end
