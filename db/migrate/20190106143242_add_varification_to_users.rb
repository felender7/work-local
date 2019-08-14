class AddVarificationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :varification, :boolean,default: false
    add_column :users, :tap_score, :integer
  end
end
