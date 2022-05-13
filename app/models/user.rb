# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authors_tests, dependent: :destroy, class_name: 'Test'
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users

  validates :username, :email, presence: true

  def test_level(level)
    tests.where(level: level)
  end
end
