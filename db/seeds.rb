# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Product.create(name: "Breakfast Cookbook",
			   product_type: "Book",
			   stock: 30,
			   cost: 6.99,
			   image: "https://i.imgur.com/TrLtqdH.jpg",
			   description: "Enjoy 5 tasty breakfast recipes from Doughnuts to Smoothies and all that's in-between!"
			)

Product.create(name: "Lunch/Dinner Cookbook",
			   product_type: "Book",
			   stock: 30,
			   cost: 12.99,
			   image: "https://i.imgur.com/LGT9Uhk.jpg",
			   description: "Enjoy 12 delicious lunch and/or dinner recipes that include chicken, turkey, beef, and seafood! Try some healthier classic recipes such as Meatloaf that taste amazing! The recipes have higher carb/lower carb options so you can eat accordingly."
			)

Product.create(name: "Side/Dessert Cookbook",
			   product_type: "Book",
			   stock: 30,
			   cost: 6.99,
			   image: "https://i.imgur.com/vebog22.jpg",
			   description: "Enjoy 7 scrumptious sides and dessert recipes! Try some healthier versions of our favorite carbs we enjoy on the side but taste just the same such as Cauliflower Mac N Cheese! The Churro Banana Bites for dessert will satisfy that sugar/sweet craving!"
			)

Product.create(name: "All Three Cookbooks",
			   product_type: "Book",
			   stock: 30,
			   cost: 19.99,
			   image: "https://i.imgur.com/ta6jnEC.jpg",
			   description: "Enjoy the whole collections of breakfast, lunch, dinner, dessert and sides all in one cookbook! Low carb enchiliadas, beef kabobs, zoodles with shrimp, pancakes, roasted potatoes, and chocolate chip cookies are just a few of the awesome healthier recipes in the cookbook."
			)