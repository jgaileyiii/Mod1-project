class Cli
    PROMPT = TTY::Prompt.new

    attr_accessor :user

    def initialize user 
        @user = user
    end
    
    def finder
        choice = PROMPT.select("What are you looking for?", %w(FB_meal FB_restaurant FB_cuisine MY_list Logout))
        if choice == "FB_meal"
            binding.pry
            MenuItem.all.each
        elsif choice == "FB_restaurant"
            puts Restaurant.all
        elsif choice == "FB_cuisine"
            puts Cuisine.all
        elsif choice == "MY_list"
            puts Favorite.all
        elsif choice == "Logout"
                start
        end
    end
        

    def start
        choice = PROMPT.select("Welcome", %w(New_user Login exit))  
        if choice == "New_user" 
            puts "What is your name?"
            user_name = gets.chomp
            new_user = User.create(name: user_name)
            self.user = new_user
            start
        elsif  choice == "Login"
            puts "Enter your login name"
            self.user = gets.chomp
            finder
        elsif choice == "exit"
            exit
        end

    # def finder
    #     choice = PROMPT.select("What are you looking for?", %w(FB_meal FB_restaurant FB_cuisine MY_list Logout))
    #     if choice == FB_meal
    #         puts Meal.all     
    #     elsif choice == FB_restaurant
    #         puts Restaurant.all
    #     elsif choice == FB_cuisine
    #         puts Cuisine.all
    #     elsif choice == MY_list
    #             Favorite.all
    #     elsif choice == Logout
    #             start
    #     end
        
        # end

         end
    end