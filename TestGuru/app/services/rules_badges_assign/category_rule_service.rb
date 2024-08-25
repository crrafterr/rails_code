module RulesBadgesAssign
  class CategoryRuleService < AssignBadgesService
    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
    end

    def call(badge)
      return unless @test_passage.passed

      (test_ids_by_category(badge) - user_test_ids_by_category(badge)).empty?
    end

    private

    def date_of_last_badge
      @user.user_badges_by_rule('ruby_category').order(:created_at).last.try(:created_at)
    end

    def test_ids_by_category(badge)
      Test.by_category(badge.value).pluck(:id)
    end

    def user_success_tests_by_category(category_name, date = nil)
      return @user.user_success_tests.joins(:category).where(category: { title: category_name }) if date.nil?

      @user.user_success_tests.joins(:category)
           .where(category: { title: category_name })
           .where('test_passages.created_at > ?', date)
    end

    def user_test_ids_by_category(badge)
      user_success_tests_by_category(badge.value, date_of_last_badge).pluck(:test_id)
    end
  end
end
