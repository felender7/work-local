class AddCompanyDetailIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :company_detail_id, :integer
    add_index :jobs, :company_detail_id
  end
end
