class AddRatingToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :rating, :integer
  end
end
