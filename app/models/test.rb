# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users, class_name: 'TestUser'

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level,
    message: "the name and level cannot be the same at the same time" }
  validates :level, numericality: { greater_than: -1 }
  
  scope :sorting_an_array, lambda { |title_category|
                             joins(:category)
                               .where(categories: { title: title_category })
                               .order(title: :desc)
                           }
  scope :tests_easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :tests_average, -> { where(level: 2..4).order(created_at: :desc) }
  scope :tests_difficult, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  default_scope { order(title: :asc) }

  def self.array_categories(title_category)
    sorting_an_array(title_category).pluck(:title)
  end
end
