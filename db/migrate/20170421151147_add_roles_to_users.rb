class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_role, :boolean, default: true
  end
end
