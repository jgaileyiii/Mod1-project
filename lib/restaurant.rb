class Restaurant < ActiveRecord::Base
    has_many :menu_items
    has_many :types, through: :menu_items
end