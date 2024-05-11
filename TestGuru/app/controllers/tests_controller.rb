class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    set_test
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
