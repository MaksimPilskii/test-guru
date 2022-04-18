class Test < ApplicationRecord
  def self.added an instance of the test_level method and a method of the sorting_an_array class(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
    .where('categories.title = ?', category)
    .order('tests.title DESC')
    .pluck('tests.title')
  end
end
