class RemoveStatusColumnFromFriends < ActiveRecord::Migration
  def change
    remove_column :friends, :status, :string
  end
end
