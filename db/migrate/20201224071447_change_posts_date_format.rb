class ChangePostsDateFormat < ActiveRecord::Migration[4.2]
  def change
    remove_column :posts, :when_posted, :datetime
  end
end
