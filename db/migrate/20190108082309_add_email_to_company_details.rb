class AddEmailToCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :company_details, :email, :string
  end
end
