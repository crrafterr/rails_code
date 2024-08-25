module RulesBadgesAssign
  class LevelRuleService < AssignBadgesService
    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
    end

    def call(badge)
      return unless @test_passage.passed

      (test_ids_by_level(badge) - user_test_ids_by_level(badge)).empty?
    end

    private

    def date_of_last_badge
      @user.user_badges_by_rule('all_tests_by_level').order(:created_at).last.try(:created_at)
    end

    def test_ids_by_level(badge)
      Test.where(level: badge.value).pluck(:id)
    end

    def user_success_tests_by_level(level, date = nil)
      return @user.user_success_tests.where(level: level) if date.nil?

      @user.user_success_tests.where(level: level)
           .where('test_passages.created_at > ?', date)
    end

    def user_test_ids_by_level(badge) 
      user_success_tests_by_level(badge.value, date_of_last_badge).pluck(:test_id)
    end
  end
end
