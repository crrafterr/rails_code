# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

categories = Category.create!([{ title: 'Ruby' },
                               { title: 'Python' }])

users = User.create!([{ first_name: 'Mike', last_name: 'Ivanov', type: 'Admin', email: 'crrafterr17@gmail.com', password: 'Qq123456', confirmed_at: Time.now },
                      { first_name: 'Tom', last_name: 'Petrov', email: 'petrov@qq.qq', password: 'Qq123456', confirmed_at: Time.now }])

tests = Test.create!([{ title: 'Ruby_beginner', level: 1, category: categories[0], author: users[0] },
                      { title: 'Python_beginner', level: 1, category: categories[1], author: users[1] }])

questions = Question.create!([{ body: 'How to declarete an array in Ruby?',        test: tests[0] },
                              { body: 'How to declarete an hash in Ruby?',         test: tests[0] },
                              { body: 'How to declarete an array in Python?',      test: tests[1] },
                              { body: 'How to declarete an dictionary in Python?', test: tests[1] }])

Answer.create!([{ body: 'colours = []',        correct: true,  question: questions[0] },
                { body: 'colours = Array.new', correct: true,  question: questions[0] },
                { body: 'colours = {}',        correct: false, question: questions[0] },
                { body: 'colours = []',        correct: false, question: questions[1] },
                { body: 'colours = Array.new', correct: false, question: questions[1] },
                { body: 'colours = {}',        correct: true,  question: questions[1] },
                { body: 'a = []',              correct: true,  question: questions[2] },
                { body: 'a = {}',              correct: false, question: questions[2] },
                { body: 'a = []',              correct: false, question: questions[3] },
                { body: 'a = {}',              correct: true,  question: questions[3] }])
