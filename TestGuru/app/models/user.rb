class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :author_for_tests, class_name: 'Test', foreign_key: :author_id

  def select_test_by_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id INNER JOIN users ON users.id = results.user_id')
        .where('users.id = ?', id)
        .where('tests.level = ?', level)
  end
end
