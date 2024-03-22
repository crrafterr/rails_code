class User < ApplicationRecord
  def select_test_by_level(level)
    tests_id = Result.where(user_id: id).map(&:test_id)
    Test.where(id: tests_id).where(level: level)
  end
end
