# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   @user = User.create({email: 'admin@gmail.com', password: 'admin12345', password_confirmation: 'admin12345', admin: 'true' , first_name: 'Admin', last_name: 'Admin'})