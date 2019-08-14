class CreateCvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cvs do |t|
      t.string :identification_type
      t.string :id_passport
      t.string :date_of_birth
      t.string :place_of_birth
      t.string :disability
      t.string :education_type
      t.timestamps
    end
  end
end
