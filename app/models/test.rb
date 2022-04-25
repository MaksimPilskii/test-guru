class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users, class_name: "TestUser", dependent: :destroy

  def self.sorting_an_array(category)
    where(category_id: Category.where(title: category))
    .order(title: :desc)
    .pluck(:title)
  end
end
