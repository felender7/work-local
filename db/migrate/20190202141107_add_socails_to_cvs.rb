class AddSocailsToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :facebook, :string
    add_column :cvs, :twitter, :string
    add_column :cvs, :linked_in, :string
  end
end
