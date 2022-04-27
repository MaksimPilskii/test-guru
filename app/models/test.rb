# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users, class_name: 'TestUser'

  def self.sorting_an_array(title_category)
    joins(:category)
      .where(categories: { title: title_category })
      .order(title: :desc)
      .pluck(:title)
  end
end
