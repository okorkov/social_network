class RemoveStatusColumnFromFriends < ActiveRecord::Migration[4.2]
  def change
    remove_column :friends, :status, :string
  end
end
