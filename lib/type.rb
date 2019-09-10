class Type < ActiveRecord::Base
    has_many :restaurants
    has_many :menus
end