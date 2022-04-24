class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :users
  has_many :users, through: :test_user

  def self.sorting_an_array(category)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: category})
    .order(title: :desc)
    .pluck(:title)
  end
end
