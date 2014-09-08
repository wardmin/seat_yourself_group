# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.delete_all

Restaurant.create!(name: "Joe's", email: "joe@joe.com", password: "foo", password_confirmation: "foo", address: "123 easy st.", city: "Toronto", province: "Ontario", postal_code: "M4Y 1P4", phone_number: "61778", description: "Good eats")