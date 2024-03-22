class User < ApplicationRecord
  def select_test_by_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id INNER JOIN users ON users.id = results.user_id')
        .where('users.id = ?', id)
        .where('tests.level = ?', level)
  end
end
