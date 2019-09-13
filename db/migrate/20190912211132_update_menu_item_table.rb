class UpdateMenuItemTable < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :favorite, :boolean, :default => false
  end
end
