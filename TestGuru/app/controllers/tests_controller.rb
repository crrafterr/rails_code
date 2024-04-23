class TestsController < ApplicationController
  before_action :find_test, only: :show

  def show; end

  def index
    @tests = Test.all
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
