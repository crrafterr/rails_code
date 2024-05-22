class GistsController < ApplicationController
  def create
    set_test_passage
    result = GistQuestionService.new(@test_passage.current_question).call
    current_user.gists.create!(question: @test_passage.current_question, url: result.gist_url)

    flash_options = if result.success?
                      { notice: t('.success', url: view_context.link_to('Gist', result.gist_url).to_s) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
