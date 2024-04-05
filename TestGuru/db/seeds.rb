# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Result.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

categories = Category.create!([{ title: 'category_1' },
                               { title: 'category_2' }])

users = User.create!([{ name: 'name_1' },
                      { name: 'name_2' }])

tests = Test.create!([{ title: 'test_1', level: 1, category: categories[0], author: users[0] },
                      { title: 'test_2', level: 2, category: categories[1], author: users[1] }])

questions = Question.create!([{ body: 'question_1', test: tests[0] },
                              { body: 'question_2', test: tests[1] }])

Answer.create!([{ body: 'answer_1', correct: true, question: questions[0] },
                { body: 'answer_2', correct: true, question: questions[1] },
                { body: 'answer_3', correct: false, question: questions[0] },
                { body: 'answer_4', correct: false, question: questions[1] }])

Result.create!([{ user: users[0], test: tests[0], status: 'started' },
                { user: users[0], test: tests[1], status: 'finished' },
                { user: users[1], test: tests[0], status: 'started' }])
