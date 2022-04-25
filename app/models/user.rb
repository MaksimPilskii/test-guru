class User < ApplicationRecord
  has_many :author, dependent: :destroy, class_name: "Test"
  has_many :test_users, dependent: :destroy
  has_many :tests, through: :test_users, class_name: "TestUser"

  def test_level(level)
    Test.joins(:test_users)
    .where(test_users: {user_id: id})
    .where(level: level)
  end
end