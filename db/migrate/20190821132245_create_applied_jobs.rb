class CreateAppliedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :applied_jobs do |t|
      t.integer :cv_id
      t.integer :user_id

      t.timestamps
    end
  end
end
