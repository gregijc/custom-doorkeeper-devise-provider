# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..100).each do |i|
	Product.create(name: 'Product #{i}', category: i, release_date: Date.today, price: 100000, created_by: 1, updated_by: 1)
end
