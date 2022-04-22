# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
category = Category.create!([{title: "Frontend"}, {title: "Backend"}, {title: "Ruby"}, {title: "HTML and CSS"}])
user = User.create!([{username: "Maksim"}, {username: "Ivan"}])
test1 = Test.create!(title: "Text markup", category_id: category.fourth.id, author_id: user.first.id, level: 2)
TestUser.create!(user_id: user.first.id, test_id: test1.id)
test1 = Test.create!(title: "Grids", category_id: category.first.id, author_id: user.first.id, level: 2)
TestUser.create!(user_id: user.first.id, test_id: test1.id)
test1 = Test.create!(title: "Cycles", category_id: category.second.id, author_id: user.second.id, level: 1)
TestUser.create!(user_id: user.second.id, test_id: test1.id)
test1 = Test.create!(title: "Databases", category_id: category.second.id, author_id: user.second.id, level: 1)
TestUser.create!(user_id: user.second.id, test_id: test1.id)
question = Question.create!([{body: "Nikolai wanted to add several consecutive spaces in the text. He added them inside the <p> tag. However, they were cut out. Which tag should Nikolai use so that spaces are not cut out?", test_id: test1.id}, {body: "Vasily needs to display the code he wrote in Java on the page. What tag does he need to use for this?", test_id: test1.id}])
Answer.create!([{body: "<adress>", question_id: question.first.id}, {body: "<code>", question_id: question.first.id}, {body: "<span>", question_id: question.first.id, correct: true}, {body: "<pre>", question_id: question.first.id}, {body: "<adress>", question_id: question.second.id}, {body: "<code>", question_id: question.second.id, correct: true}, {body: "<span>", question_id: question.second.id}, {body: "<java>", question_id: question.second.id}])
