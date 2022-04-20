class Test < ApplicationRecord
  def self.sorting_an_array(category)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where('categories.title = :category', category: category)
    .order('tests.title DESC')
    .pluck('tests.title')
  end
end
