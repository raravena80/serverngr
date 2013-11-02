class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :server_name
      t.string :server_id
      t.string :server_type
      t.string :server_public_ipaddress
      t.string :server_private_ipaddress
      t.string :server_account
      t.string :server_password
      t.string :server_status

      t.timestamps
    end
  end
end
