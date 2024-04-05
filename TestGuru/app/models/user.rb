class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :author_for_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  scope :select_tests_by_level, ->(level) { where(tests: { level: level }) }

  validates :name, presence: true
end
