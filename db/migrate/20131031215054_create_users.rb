class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid,                :null => false
      t.string :provider,           :null => false
      t.string :email,              :null => false
      t.string :first_name,         :null => false
      t.string :last_name,          :null => false
      t.string :github_username
      t.string :ssh_username
      t.string :ssh_public_key
      t.string :linux_password_hash
      t.boolean :enabled,           :null => false, :default => true

      t.timestamps
    end
  end
end
