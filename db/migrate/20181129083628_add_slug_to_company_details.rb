class AddSlugToCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :company_details, :slug, :string
    add_index :company_details, :slug , unique: true
  end
end
