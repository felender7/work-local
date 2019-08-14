class AddDescriptionToCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :company_details, :description, :text
  end
end
