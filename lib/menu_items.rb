class Menu_items < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :type
end
