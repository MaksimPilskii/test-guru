# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



category = Category.create!([{title: "Frontend"}, {title: "Backend"}, {title: "Ruby"}, {title: "HTML and CSS"}])
user = User.create!([{username: "Maksim"}, {username: "Ivan"}])
test1 = Test.create!(title: "Text markup", category: category[0], author: user[0], level: 2)
TestUser.create!(user: user[0], test: test1)
test1 = Test.create!(title: "Grids", category: category[0], author: user[0], level: 2)
TestUser.create!(user: user[0], test: test1)
test1 = Test.create!(title: "Cycles", category: category[1], author: user[1], level: 1)
TestUser.create!(user: user[1], test: test1)
test1 = Test.create!(title: "Databases", category: category[1], author: user[1], level: 1)
TestUser.create!(user: user[1], test: test1)
question = Question.create!([{body: "Nikolai wanted to add several consecutive spaces in the text. He added them inside the <p> tag. However, they were cut out. Which tag should Nikolai use so that spaces are not cut out?", test: test1}, {body: "Vasily needs to display the code he wrote in Java on the page. What tag does he need to use for this?", test: test1}])
Answer.create!([{body: "<adress>", question: question[0]}, {body: "<code>", question: question[0]}, {body: "<span>", question: question[0], correct: true}, {body: "<pre>", question: question[0]}, {body: "<adress>", question: question[1]}, {body: "<code>", question: question[1], correct: true}, {body: "<span>", question: question[1]}, {body: "<java>", question: question[1]}])
