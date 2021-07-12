class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :name
      t.string :image
      t.string :description
      t.integer :favorites_count
      t.belongs_to :user

      t.timestamps
    end
  end
end
