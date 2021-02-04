class RemoveAvatarAndCellFromUsers < ActiveRecord::Migration[4.2]
  def change
    remove_column :users, :cell_phone, :string
    remove_column :users, :avatar, :string
  end
end
