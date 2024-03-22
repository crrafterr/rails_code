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

tests = Test.create!([{ title: 'test_1', level: 1, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'test_2', level: 2, category_id: categories[1].id, author_id: users[1].id }])

questions = Question.create!([{ body: 'question_1', test_id: tests[0].id },
                              { body: 'question_2', test_id: tests[1].id }])

Answer.create!([{ body: 'answer_1', correct: true, question_id: questions[0].id },
                { body: 'answer_2', correct: true, question_id: questions[1].id },
                { body: 'answer_3', correct: false, question_id: questions[0].id },
                { body: 'answer_4', correct: false, question_id: questions[1].id }])

Result.create!([{ user_id: users[0].id, test_id: tests[0].id, status: 'started' },
                { user_id: users[0].id, test_id: tests[1].id, status: 'finished' },
                { user_id: users[1].id, test_id: tests[0].id, status: 'started' }])
