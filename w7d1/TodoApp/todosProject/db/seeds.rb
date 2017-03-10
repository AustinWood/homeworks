# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Todo.destroy_all
t1 = Todo.create!(title: "Buy a car", body: "I like cars", done: false)
t2 = Todo.create!(title: "Pet a zebra", body: "Zebras are cool", done: true)
t2 = Todo.create!(title: "I am three", body: "Third todo!", done: false)
