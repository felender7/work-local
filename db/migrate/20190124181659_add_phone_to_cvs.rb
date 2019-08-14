class AddPhoneToCvs < ActiveRecord::Migration[5.2]
  def change
    add_column :cvs, :phone, :string
  end
end
