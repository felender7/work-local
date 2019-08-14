class AddUserIdToReferrals < ActiveRecord::Migration[5.2]
  def change
    add_column :referrals, :user_id, :integer
    add_index :referrals, :user_id
  end
end
