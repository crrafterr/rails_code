class GistsController < ApplicationController
  def create
    set_test_passage
    set_gist_service

    result = @gist_service.call
    current_user.gists.create!(question: @test_passage.current_question, url: result.html_url)

    flash_options = if @gist_service.success?
                      { notice: t('.success', url: view_context.link_to('Gist', result.html_url).to_s) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_gist_service
    @gist_service = GistQuestionService.new(@test_passage.current_question)
  end
end
