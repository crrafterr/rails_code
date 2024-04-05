class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_max_answers

  private

  def validate_max_answers
    errors.add(:question) if question.answers.count > 4
  end
end
