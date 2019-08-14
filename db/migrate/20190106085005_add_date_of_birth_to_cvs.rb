class AddDateOfBirthToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :date_of_birth, :date
  end
end
