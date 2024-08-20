class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def assign_badges
    Badge.all.each do |badge|
      @user.badges.push(badge) if send(badge.rule, badge)
    end
  end

  def first_try(badge)
    @user.tests.where(id: @test.id).count == badge.value.to_i && @test_passage.passed
  end

  def all_test_by_level(badge)
    return unless @user.badges.exclude?(badge)

    Test.where(level: badge.value).count == user_tests_by_level(badge.value).pluck(:test_id).uniq.count
  end

  def ruby_category(badge)
    return unless @user.badges.exclude?(badge)

    Test.by_category(badge.value).count == user_tests_by_category(badge.value).count
  end

  private

  def user_tests
    @user.test_passages.joins(:test).where(passed: true)
  end

  def user_tests_by_level(level)
    user_tests.where(tests: { level: level })
  end

  def user_tests_by_category(category_name)
    @user.tests.by_category(category_name)
         .joins(:test_passages)
         .where(test_passages: { passed: true })
  end
end
