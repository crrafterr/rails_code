class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
    render plain: @questions.inspect.to_s
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @test.questions.create!(body: params[:question][:body])
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    redirect_to test_questions_url(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_question_not_found
    render plain: 'Question not found'
  end
end
