class Cli
    PROMPT = TTY::Prompt.new

    attr_accessor :user

    def initialize user 
        @user = user
    end
    
    def restaurant
        restaurant_choice = PROMPT.select("Where would you like to go?", Restaurant.all.map {|restaurant| restaurant.name})
        restaurant_selection = Restaurant.all.find_by(name: restaurant_choice).id
        our_menu_item =  MenuItem.all.find_by(restaurant_id: restaurant_selection).name
        end_find_restaurant = PROMPT.select("What's on the menu?", "#{our_menu_item}", "Return")
        if end_find_restaurant == "Return"
            finder
        end
    end

    def finder
        choice = PROMPT.select("What are you looking for?", "Find By Meal", "Find By Cuisine", "Restaurants", "My List", "Logout")
        if choice == "Find By Meal"
            meal_choice = PROMPT.select("What are you in the mood for?", MenuItem.all.map {|item| item.name})
            meal_item = MenuItem.all.find_by(name: meal_choice)
            end_find_meal = PROMPT.select("            Where? #{meal_item.restaurant.name},
            Location? #{meal_item.restaurant.location},
            Rating? #{meal_item.restaurant.rating}", "Return")
            if end_find_meal == "Return"
                finder
            end
        elsif choice == "Find By Cuisine"
            cuisine_choice = PROMPT.select("What kind of food would you like?", Cuisine.all.map {|cuisine| cuisine.name})
            cuisine_selection = Cuisine.all.find_by(name: cuisine_choice).name
            our_cuisine_choice = MenuItem.all.select {
                |item| item.cuisine.name == cuisine_selection
            }.map {|selected_inst| selected_inst.restaurant.name}.join
            end_find_cuisine = PROMPT.select("These restaurants have this cuisine: #{our_cuisine_choice}", "Restaurants", "Return")
            if end_find_cuisine == "Restaurants"
                restaurant
            end
            if end_find_cuisine == "Return"
                finder
            end
        elsif choice == "Restaurants"
            restaurant
        elsif choice == "My List"
            PROMPT.select("My List",Favorite.all.map {|favorite| favorite.name})
        elsif choice == "Logout"
            start
        end
    end
        

    def start
        choice = PROMPT.select("Welcome", "New User", "Login", "Exit")  
        if choice == "New_user" 
            puts "What is your name?"
            user_name = gets.chomp
            user = User.create(name: user_name) 
            start
        elsif  choice == "Login"
            puts "Enter your login name"
            self.user = gets.chomp
            finder
        elsif choice == "Exit"
            exit 
        end
    end
end




