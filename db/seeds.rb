# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(name: 'RingStix', description: 'Fun outdoor toy', price_in_cents: 1999)
Product.create(name: 'iPhone 5', description: 'A cool apple device', price_in_cents: 69999)
Product.create(name: 'Couch', description: 'Great for sitting on', price_in_cents: 34999)
Product.create(name: 'Samsung S5', description: 'A cool android phone', price_in_cents: 54999)

100.times do |i|
	Product.create({
		name: "Product#{i}",
		description: "Description#{i}",
		price_in_cents: i
		}
	)
end