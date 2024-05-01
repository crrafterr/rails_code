class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_for_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true

  def select_test_by_level(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
