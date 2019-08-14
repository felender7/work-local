class AddUserIdToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :user_id, :integer
    add_index :cvs, :user_id
  end
end
