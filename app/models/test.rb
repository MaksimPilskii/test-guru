# frozen_string_literal: true

class Test < ApplicationRecord
  default_scope { order(title: :asc) }

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level,
                                  message: 'the name and level cannot be the same at the same time' }
  validates :level, numericality: { greater_than: -1 }

  scope :category, lambda { |title_category|
                     joins(:category)
                       .where(categories: { title: title_category })
                       .order(title: :desc)
                   }
  scope :easy_tasks, -> { where(level: 0..1) }
  scope :average_tasks, -> { where(level: 2..4) }
  scope :difficult_tasks, -> { where(level: 5..Float::INFINITY) }

  def self.array_categories(title_category)
    sorting_an_array(title_category).pluck(:title)
  end
end
