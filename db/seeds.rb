MenuItem.destroy_all
Restaurant.destroy_all
Cuisine.destroy_all

sputnik = Restaurant.create({
    name: "Sputnik", 
    location: "S. Broadway", 
    rating: 5})

gyroz = Restaurant.create({
    name: "Gyroz",
    location: "Colfax",
    rating: 2
})

watercourse = Restaurant.create({
    name: "Watercourse",
    location: "17th St.",
    rating: 9
})

american = Cuisine.create(name: "American")
mediterranean = Cuisine.create(name: "Mediterranean")
vegan = Cuisine.create(name: "Vegan")

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