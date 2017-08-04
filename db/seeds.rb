# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: "Juliana", 
			last_name: "Lagattuta",
			email: "babygirl32604@gmail.com",
			password: 1234,
			password_confirmation: 1234,
			admin: true)

Product.create(name: "Cookbook",
			   product_type: "Book",
			   stock: 100,
			   cost: 40)