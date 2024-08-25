class AssignBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  RULE = { first_try?: RulesBadgesAssign::FirstTryRuleService,
           ruby_category: RulesBadgesAssign::CategoryRuleService,
           all_tests_by_level: RulesBadgesAssign::LevelRuleService }.freeze

  def call
    assign_badges
  end

  private

  def assign_badges
    Badge.find_each do |badge|
      @user.badges.push(badge) if RULE[badge.rule.to_sym].new(@test_passage).call(badge)
    end
  end
end
