# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(username: "Maksim")
User.create!(username: "Ivan")
Category.create!(title: "Frontend")
Category.create!(title: "Backend")
Category.create!(title: "Ruby")
Category.create!(title: "HTML and CSS")
Test.create!(title: "Text markup", category_id: 4, author_id: 1, level: 2)
Test.create!(title: "Grids", category_id: 1, author_id: 1, level: 2)
Test.create!(title: "Cycles", category_id: 2, author_id: 2, level: 1)
Test.create!(title: "Databases", category_id: 2, author_id: 2, level: 1)
Question.create!(body: "Nikolai wanted to add several consecutive spaces in the text. He added them inside the <p> tag. However, they were cut out. Which tag should Nikolai use so that spaces are not cut out?", test_id: 1)
Answer.create!(body: "<adress>", question_id: 1)
Answer.create!(body: "<code>", question_id: 1)
Answer.create!(body: "<span>", question_id: 1, correct: true)
Answer.create!(body: "<pre>", question_id: 1)
Question.create!(body: "Vasily needs to display the code he wrote in Java on the page. What tag does he need to use for this?", test_id: 1)
Answer.create!(body: "<adress>", question_id: 2)
Answer.create!(body: "<code>", question_id: 2, correct: true)
Answer.create!(body: "<span>", question_id: 2)
Answer.create!(body: "<java>", question_id: 2)
