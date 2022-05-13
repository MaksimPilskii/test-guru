# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Ruby' },
                                { title: 'HTML and CSS' }
                              ])

users = User.create!([
                       { username: 'Maksim', email: 'RoR@gmail.com' },
                       { username: 'Ivan', email: 'Ivan@gmail.com' }
                     ])

tests = Test.create!([
                       { title: 'Text markup', category: categories[0], author: users[0], level: 2 },
                       { title: 'Ruby', category: categories[2], author: users[0], level: 2 },
                       { title: 'HTML', category: categories[3], author: users[1], level: 1 },
                       { title: 'Databases', category: categories[1], author: users[1], level: 1 }
                     ])

questions = Question.create!([
                               { body: 'Nikolai wanted to add several consecutive spaces in the text. He added them inside the <p> tag. However, they were cut out. Which tag should Nikolai use so that spaces are not cut out?', test: tests[0] },
                               { body: 'Vasily needs to display the code he wrote in Java on the page. What tag does he need to use for this?', test: tests[0] },
                               { body: 'Which method allows you to lower-case a string?', test: tests[1] },
                               { body: 'a method that allows you to get a positive number', test: tests[1] },
                               { body: 'which returns the following expression: [1, 2, 3, 4, 5].reject { |x| x.even? }.map { |x| x*x }', test: tests[1] }, { body: 'which returns the following expression:  x = Fixnum.new', test: tests[1] },
                               { body: 'What attribute is used to combine table cells horizontally?', test: tests[2] },
                               { body: 'Which tag should be used to set captions to form fields?', test: tests[2] },
                               { body: 'What attribute is used to set the width of the textarea field?', test: tests[2] },
                               { body: 'What attribute can be used to set the text for the image that will be displayed if it fails to load?', test: tests[2] }
                             ])

answers = Answer.create!([
                           { body: '<adress>', question: questions[0] },
                           { body: '<code>', question: questions[0] },
                           { body: '<span>', question: questions[0], correct: true },
                           { body: '<pre>', question: questions[0] },

                           { body: '<adress>', question: questions[1] },
                           { body: '<code>', question: questions[1], correct: true },
                           { body: '<span>', question: questions[1] },
                           { body: '<java>', question: questions[1] },

                           { body: 'downcase()', question: questions[2], correct: true },
                           { body: 'dcase()', question: questions[2] },
                           { body: 'lower', question: questions[2] },
                           { body: 'downletter', question: questions[2] },

                           { body: 'positive', question: questions[3] },
                           { body: 'integer', question: questions[3] },
                           { body: 'abs', question: questions[3], correct: true },
                           { body: 'negative', question: questions[3] },

                           { body: '[1, 9, 25]', question: questions[4], correct: true },
                           { body: '[1, 4, 9, 16, 25]', question: questions[4] },
                           { body: '[4, 16]', question: questions[4] },
                           { body: '[]', question: questions[4] },

                           { body: '0', question: questions[5] },
                           { body: "undefined method 'new'", question: questions[5], correct: true },
                           { body: 'nil', question: questions[5] },
                           { body: 'null', question: questions[5] },

                           { body: 'colspan', question: questions[6], correct: true },
                           { body: 'unity', question: questions[6] },
                           { body: 'rowspan', question: questions[6] },
                           { body: 'union', question: questions[6] },

                           { body: 'type', question: questions[7] },
                           { body: 'label', question: questions[7], correct: true },
                           { body: 'rowspan', question: questions[7] },
                           { body: 'union', question: questions[7] },

                           { body: 'width', question: questions[8] },
                           { body: 'cols', question: questions[8], correct: true },
                           { body: 'size', question: questions[8] },
                           { body: 'rows', question: questions[8] },

                           { body: 'title', question: questions[9] },
                           { body: 'popup', question: questions[9] },
                           { body: 'caption', question: questions[9] },
                           { body: 'alt', question: questions[9], correct: true }
                         ])
