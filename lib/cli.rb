class Cli
    PROMPT = TTY::Prompt.new

    attr_accessor :user

    def initialize user 
        @user = user
    end

    def finder
        choice = PROMPT.select("What are you looking for?", "Find By Meal", "Find By Cuisine", "Restaurants", "My List", "Logout")
        if choice == "Find By Meal"
            puts`clear`
            meal_choices = MenuItem.all.map {|item| item.name}
            meal_choice = PROMPT.select("What are you in the mood for?", meal_choices, per_page: meal_choices.count)
            meal_item = MenuItem.find_by(name: meal_choice)
            end_find_meal = PROMPT.select("            Where? #{meal_item.restaurant.name},
            Location? #{meal_item.restaurant.location},
            Rating? #{meal_item.restaurant.rating}", "Return")
            if end_find_meal == "Return"
                puts`clear`
                finder      
            end
        elsif choice == "Find By Cuisine"
            puts`clear`
            cuisine_choice = PROMPT.select("What kind of food would you like?", Cuisine.all.map {|cuisine| cuisine.name})
            cuisine_selection = Cuisine.all.find_by(name: cuisine_choice).name
            our_cuisine_choice = MenuItem.all.select {
                |item| item.cuisine.name == cuisine_selection
            }.map {|selected_inst| selected_inst.restaurant.name}.uniq.join(", ")
            end_find_cuisine = PROMPT.select("These restaurants have this cuisine: #{our_cuisine_choice}", "Menu", "Return")
            if end_find_cuisine == "Menu"
                puts `clear`
                finder
            end
            if end_find_cuisine == "Return"
                puts`clear`
                finder
            end
        elsif choice == "Restaurants"
            restaurant
        elsif choice == "My List"
            user_favorites = Favorite.where(users_id: @user.id)
            restaurant_ids = user_favorites.map { |fav| fav.restaurants_id }
            restaurants = Restaurant.where(id: restaurant_ids)
            names = restaurants.map {|rest| rest.name}
            list_choice = PROMPT.select("These are your favorite restaurants: #{names.join(", ")}", "Return")
            if list_choice == "Return"
                puts`clear`
                finder
            end
        elsif choice == "Logout"
            puts`clear`
            start
        end
    end

    def save_favorite(restaurants_id)
        fav_choice = PROMPT.select('Do you want to add this item to favorites?', "Yes", "No")
        if fav_choice == "Yes"
            Favorite.create(restaurants_id: restaurants_id, users_id: @user.id)
            puts`clear`
            finder
        end
        if fav_choice == "No"
            puts`clear`
            finder
        end
    end
    
    def restaurant
        restaurant_choice = PROMPT.select("Where would you like to go?", Restaurant.all.map {|restaurant| restaurant.name})
        restaurant_selection = Restaurant.all.find_by(name: restaurant_choice).id
        our_menu_item =  MenuItem.where(restaurant_id: restaurant_selection).pluck(:name)
        end_find_restaurant = PROMPT.select("What's on the menu?", our_menu_item, "Save Restaurant to My List", "Return")
        if our_menu_item.include?(end_find_restaurant)
            puts`clear`
            finder
        end
        if end_find_restaurant == "Save Restaurant to My List"
            puts`clear`
            save_favorite(restaurant_selection)
        end
        if end_find_restaurant == "Return"
            puts`clear`
            finder
        end
    end




    
        

    def start
        puts`clear`
        choice = PROMPT.select("Welcome", "New User", "Login", "Exit")  
        if choice == "New User" 
            puts "What is your name?"
            user_name = gets.chomp.upcase
            @user = User.create(name: user_name) 
            puts`clear`
            start
        elsif  choice == "Login"
            puts`clear`
            puts "Enter your login name"
            user = gets.chomp.upcase
            @user = User.all.find_by(name: user)
            puts`clear`
            finder
        elsif choice == "Exit"
            exit 
        end
    end
end



