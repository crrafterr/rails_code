class Test < ApplicationRecord
  def self.sort_tests_by_category(category_name)
    tables = Test.joins('INNER JOIN categories ON categories.id = tests.category_id')

    tables.where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
  end
end
