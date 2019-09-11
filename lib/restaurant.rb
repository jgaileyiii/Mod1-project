class Restaurant < ActiveRecord::Base
    has_many :menu_items
    has_many :cuisines, through: :menu_items
    has_many :favorites
    has_many :users, through: :favorites
end


