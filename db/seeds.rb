Favorite.destroy_all
MenuItem.destroy_all
Restaurant.destroy_all
Cuisine.destroy_all

sputnik = Restaurant.create({
    name: "Sputnik", 
    location: "3 S. Broadway", 
    rating: 5})

gyroz = Restaurant.create({
    name: "Gyroz",
    location: "880 E Colfax Ave",
    rating: 2
})

watercourse = Restaurant.create({
    name: "Watercourse",
    location: "837 E 17th Ave",
    rating: 9
})

litte_gingko = Restaurant.create({
    name: "Little Gingko",
    location: "13th and Marion St.",
    rating: 8
})

work_and_class = Restaurant.create({
    name: "Work & Class",
    location: "2500 Larimer St.",
    rating: 9
})

american = Cuisine.create(name: "American")
mediterranean = Cuisine.create(name: "Mediterranean")
vegan = Cuisine.create(name: "Vegan")
asian = Cuisine.create(name: "Asian")

cuban = MenuItem.create({
    name: "Cuban Sandwich",
    ingredients: "Pork",
    price: 10,
    restaurant: sputnik,
    cuisine: american
})

gyro = MenuItem.create({
    name: "Gyro",
    ingredients: "Lamb",
    price: 10,
    restaurant: gyroz,
    cuisine: mediterranean
})

breakfast_burrito = MenuItem.create({
    name: "Breakfast Burrito",
    ingredients: "Tofu",
    price: 10,
    restaurant: watercourse,
    cuisine: vegan
})

skillet_hash = MenuItem.create({
    name: "Skillet Hash",
    ingredients: "Sweet Potatoes, Scrambled Tofu, Greens",
    price: 12,
    restaurant: watercourse,
    cuisine: vegan
})

pancake_stack = MenuItem.create({
    name: "Pancake Stack",
    ingredients: "Three Pancakes, Syrup, Berries",
    price: 12,
    restaurant: watercourse,
    cuisine: vegan
})

chicken_sandwich = MenuItem.create({
    name: "Chicken Sandwich",
    ingredients: "Chicken Breast, Pita, Tomato, Onion, Tzatziki",
    price: 6,
    restaurant: gyroz,
    cuisine: mediterranean
})

salad_with_gyro = MenuItem.create({
    name: "Salad with Gyro",
    ingredients: "Lettuce, Tomato, Cucumber, Feta, Olives, Gyro",
    price: 9,
    restaurant: gyroz,
    cuisine: mediterranean
})

grilled_cheese = MenuItem.create({
    name: "Grilled Cheese",
    ingredients: "Focaccia, Swiss, Cheddar, Monterey Jack",
    price: 8,
    restaurant: sputnik,
    cuisine: american
})

banh_mi = MenuItem.create({
    name: "Banh Mi",
    ingredients: "Short Rib, Pickled Carrots & Daikon, Cucumber, Hoagie",
    price: 10,
    restaurant: sputnik,
    cuisine: asian
})

hong_kong_noodles = MenuItem.create({
    name: "Hong Kong Noodles",
    ingredients: "Egg Noodles, Shrimp, Vegetable",
    price: 13,
    restaurant: litte_gingko,
    cuisine: asian
})

vegetable_ramen = MenuItem.create({
    name: "Vegetable Ramen",
    ingredients: "Ramen, Vegetable",
    price: 9,
    restaurant: litte_gingko,
    cuisine: asian
})

kung_pao_shrimp = MenuItem.create({
    name: "Kung Pao Shrimp",
    ingredients: "Shrimp, Vegetable, Red Chili Pepper, Peanuts, Rice",
    price: 9,
    restaurant: litte_gingko,    
    cuisine: asian
})

halibut_ceviche = MenuItem.create({
    name: "Halibut Ceviche",
    ingredients: "Pineapple, Cucumber, Pico, Avocado",
    price: 14,
    restaurant: work_and_class,
    cuisine: american
})

colorado_lamb = MenuItem.create({
    name: "Coriander Roasted Colorado Lamb",
    ingredients: "Lamb",
    price: 18,
    restaurant: work_and_class,
    cuisine: american
})

butterscotch_pudding = MenuItem.create({
    name: "Butterscotch Pudding",
    ingredients: "Almond Toffee, Whipped Cream",
    price: 6,
    restaurant: work_and_class,
    cuisine: american
})