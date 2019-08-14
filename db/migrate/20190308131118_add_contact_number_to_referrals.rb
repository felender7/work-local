class AddContactNumberToReferrals < ActiveRecord::Migration[5.2]
  def change
    add_column :referrals, :contact_number, :string
    add_column :referrals, :slug, :string
    add_index :referrals, :slug, unique: true
  end
end
