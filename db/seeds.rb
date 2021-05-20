# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Science')
Category.create(name: 'Tech')
Category.create(name: 'Sport')
User.create(username: 'olena', password: 'olena')
Post.create(title: 'First post', text: 'First post', user_id: 1, category_id:1)