class AddExtraInfoToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :job_function, :string
    add_column :cvs, :job_industry, :string
    add_column :cvs, :availability, :string
    add_column :cvs, :salary_range, :string
  end
end


 
