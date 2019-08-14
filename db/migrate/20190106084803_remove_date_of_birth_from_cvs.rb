class RemoveDateOfBirthFromCvs < ActiveRecord::Migration[5.2]
  def change
    remove_column :cvs, :date_of_birth, :string
  end
end
