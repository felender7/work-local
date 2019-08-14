class CreateReferrals < ActiveRecord::Migration[5.2]
  def change
    create_table :referrals do |t|
      t.string :institution
      t.string :contact_person
      t.string :position
        
      t.timestamps
    end
  end
end
