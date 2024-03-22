class Test < ApplicationRecord
  def self.sort_tests_by_category(category_name)
    joins('INNER JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', category_name)
      .order(title: :desc)
      .pluck(:title)
  end
end
