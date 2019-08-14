class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :city
      t.string :work_type
      t.string :contract_type
      t.string :salary
      t.string :requirements
      t.string :slug

      t.timestamps
    end
    add_index :jobs, :slug , unique: true
  end
end
