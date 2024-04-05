class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :author_for_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  def select_test_by_level(level)
    tests.where(tests: { level: level })
  end
end
