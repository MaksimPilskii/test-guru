class Test < ApplicationRecord
  def self.sorting_an_array(category)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: category})
    .order(title: :desc)
    .pluck(:title)
  end
end
