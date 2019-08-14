class AddCvIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :cv_id, :integer
  end
end
