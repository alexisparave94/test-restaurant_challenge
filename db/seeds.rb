# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(first_name: 'Admin', role: 'admin')
user2 = User.create(first_name: 'Manager1', role: 'manager')
user3 = User.create(first_name: 'Manager2', role: 'manager')
user4 = User.create(first_name: 'Waiter1', role: 'waiter')
user5 = User.create(first_name: 'Waiter4', role: 'waiter')
user6 = User.create(first_name: 'Waiter2', role: 'waiter')
user7 = User.create(first_name: 'Waiter3', role: 'waiter')
user8 = User.create(first_name: 'Customer1')
user9 = User.create(first_name: 'Customer2')

res1 = Restaurant.create(city: 'Sao Paulo', manager: user2)
res2 = Restaurant.create(city: 'Lima', manager: user3)

pro1 = Product.create(name: 'Product1', category: 'salad', global: true)
pro2 = Product.create(name: 'Product2', category: 'starter', global: true)
pro3 = Product.create(name: 'Product3', category: 'starter')
pro4 = Product.create(name: 'Product4', category: 'drink')

item1 = MenuItem.create(restaurant: res1, product: pro3)
item2 = MenuItem.create(restaurant: res2, product: pro4)