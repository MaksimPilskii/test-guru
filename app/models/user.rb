# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :authors_tests, dependent: :destroy, class_name: 'Test'
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password

  def test_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
