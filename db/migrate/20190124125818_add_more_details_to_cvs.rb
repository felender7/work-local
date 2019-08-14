class AddMoreDetailsToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :phone, :string
    add_column :cvs, :first_name, :string
    add_column :cvs, :last_name, :string
  end
end
