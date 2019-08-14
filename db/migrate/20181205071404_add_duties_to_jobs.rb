class AddDutiesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :duties, :text
  end
end
