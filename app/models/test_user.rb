# frozen_string_literal: true

class TestUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
