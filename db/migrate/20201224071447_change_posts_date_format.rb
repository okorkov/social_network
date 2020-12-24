class ChangePostsDateFormat < ActiveRecord::Migration
  def change
    remove_column :posts, :when_posted, :datetime
  end
end
