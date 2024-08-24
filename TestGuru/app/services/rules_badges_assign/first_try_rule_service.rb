module RulesBadgesAssign
  class FirstTryRuleService < AssignBadgesService
    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
    end

    def call(badge)
      return unless @test_passage.passed

      @user.test_passages.where(test_id: @test.id).count == badge.value.to_i
    end
  end
end
