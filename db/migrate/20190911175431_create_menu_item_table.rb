class CreateMenuItemTable < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :ingredients
      t.integer :price
      t.references :restaurant, foreign_key: true
      t.references :cuisine, foreign_key: true
    end
  end
end
