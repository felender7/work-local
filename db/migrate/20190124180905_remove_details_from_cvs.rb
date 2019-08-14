class RemoveDetailsFromCvs < ActiveRecord::Migration[5.2]
  def change
    remove_column :cvs, :phone
    remove_column :cvs, :first_name
    remove_column :cvs, :last_name
  end
end
