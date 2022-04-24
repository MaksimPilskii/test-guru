class User < ApplicationRecord
  has_many :tests
  has_many :tests, through: :test_user

  def test_level(level)
    Test.joins('JOIN test_users ON test_users.test_id = tests.id ')
    .where(test_users: {user_id: id})
    .where(level: level)
  end
end
