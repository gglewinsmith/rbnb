# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Device.destroy_all
# user = User.new(email: "k8hunter@hotmail.com", password: "difficult_password")
# user.save!
Device.create(name: "iphone 7", price_per_week: 10, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", condition_of_device: "used", age_of_device: 2, type_of_device: "phone", user: user)
Device.create(name: "iphone 10", price_per_week: 14, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", condition_of_device: "new", age_of_device: 0, type_of_device: "phone", user: user)
Device.create(name: "Macbook Pro", price_per_week: 20, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", condition_of_device: "used", age_of_device: 2, type_of_device: "laptop", user: user)





