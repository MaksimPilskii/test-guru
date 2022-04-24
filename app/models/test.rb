class Test < ApplicationRecord
  belongs_to :category
  has_many :question
  belongs_to :user
  has_many :user, through :testuser
  
  def self.sorting_an_array(category)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: category})
    .order(title: :desc)
    .pluck(:title)
  end
end
