class CreateCompanyDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :company_details do |t|
      t.string :company_name
      t.string :registration
      t.string :tel
      t.string :industry

      t.timestamps
    end
  end
end
