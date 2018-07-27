# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name: "steven",
             email: "steven@email.com",
             password: "12345steven",
             password_confirmation: "12345steven",
             admin: false)

Post.create!(title: "test1",
             content:"contenttest1",
             user_id: "1")

Post.create!(title: "test2",
             content: "contenttest2",
             user_id: "1")
