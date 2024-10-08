class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  PASSING_PERCENTAGE = 85

  def completed?
    current_question.nil? || time_is_up?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def calculate_percentage
    (correct_questions.to_f / test.questions.count) * 100
  end

  def passed?
    (calculate_percentage >= PASSING_PERCENTAGE)
  end

  def result
    self.passed = passed?

    save!
  end

  def current_question_number
    test.questions.ids.find_index(current_question.id) + 1
  end

  def time_is_up?
    (completion_time.to_i - Time.now.to_i).negative?
  end

  def completion_time
    created_at + (test.timer * 60)
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_current_question
    return self.current_question = set_first_question if current_question.nil?

    self.current_question = next_question
  end
end
