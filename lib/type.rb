class Type < ActiveRecord::Base
    has_many :restaurants,:menus
end