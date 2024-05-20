# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_gist_service, only: :gist
  before_action :authenticate_user!

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = @gist_service.call
    current_user.gists.create(question: @test_passage.current_question, url: result.html_url)

    flash_options = if @gist_service.success?
                      { notice: t('.success', url: view_context.link_to('Gist', result.html_url).to_s) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_gist_service
    @gist_service = GistQuestionService.new(@test_passage.current_question)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
