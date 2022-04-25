class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users, class_name: "TestUser", dependent: :destroy

  def test_level(level)
    TestUser.where(user_id: id, test_id: Test.where(level: level))
  end
end
