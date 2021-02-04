class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :dob
      t.string :cell_phone
      t.string :avatar
    end
  end
end
