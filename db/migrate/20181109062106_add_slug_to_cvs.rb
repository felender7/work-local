class AddSlugToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :slug, :string
    add_index :cvs, :slug, unique: true
  end
end
