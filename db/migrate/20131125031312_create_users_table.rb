class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.string :token
    end
    
    add_index :users, :token, unique: true
  end
end
