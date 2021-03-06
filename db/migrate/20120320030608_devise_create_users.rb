class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username, :null => false, :required => true

      # authenticatable
      t.string :email,              :null => true, :default => nil
      t.string :encrypted_password, :null => true, :default => nil

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :username, :unique => true
  end
end
