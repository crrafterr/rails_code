require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_for_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  has_secure_password

  EMAIL_FORMAT = /\A[a-z\d_+.-]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.freeze

  validates :name, presence: true
  validates :email, presence: true, format: EMAIL_FORMAT, uniqueness: { case_sensitive: false }

  def select_test_by_level(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
