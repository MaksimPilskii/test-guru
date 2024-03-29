# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authors_tests, dependent: :destroy, class_name: 'Test'
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :username, :email, presence: true

  def test_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
