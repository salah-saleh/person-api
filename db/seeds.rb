# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

user_1 = User.create!({email: 'a@b.com', password: '123456'})
user_2 = User.create!({email: 'c@d.com', password: '123456'})
categories_1 = Category.create!([ {name: 'Action'}])
categories_2 = Category.create!([{ name: 'Drama' }, {name: 'Adventure'}, {name: 'fantasy'}])
movie_1 = Movie.new({ title: 'Lord of the Rings', text: 'this is a cool movie you should watch' })
movie_2 = Movie.new({ title: 'Star Wars', text: 'this is a classic. may the force be with you'  })
movie_1.categories = categories_1
movie_2.categories = categories_2
movie_1.user = user_1
movie_2.user = user_2
rating_1 = Rating.new({ score: 4 })
rating_1.movie = movie_1
rating_1.user = user_1
movie_1.save!
movie_2.save!
rating_1.save!
