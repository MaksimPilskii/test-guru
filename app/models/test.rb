# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users, class_name: 'TestUser'

  validates :title, presence: true
  validates :level, numericality: { greater_than: -1 }
  validates_uniqueness_of :title, scope: [:level]

  scope :sorting_an_array, lambda { |title_category|
                             joins(:category)
                               .where(categories: { title: title_category })
                               .order(title: :desc)
                               .pluck(:title)
                           }
  scope :tests_easy, -> { where(level: 0..1).order(created_at: :desc) }
  scope :tests_average, -> { where(level: 2..4).order(created_at: :desc) }
  scope :tests_difficult, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  default_scope { order(title: :asc) }
end
