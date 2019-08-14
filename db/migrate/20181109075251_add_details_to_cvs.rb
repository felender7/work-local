class AddDetailsToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :gender, :string
    add_column :cvs, :ethnicity, :string
  end
end
