class AddUserIdToCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :company_details, :user_id, :integer
    add_index :company_details, :user_id
  end
end
