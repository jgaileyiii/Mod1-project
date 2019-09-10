class CreateTypesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name
      t.references :restaurant, foreign_key: true
      t.references :menu, foreign_key: true
    end
  end
end
