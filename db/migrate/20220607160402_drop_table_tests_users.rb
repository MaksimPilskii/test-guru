# frozen_string_literal: true

class DropTableTestsUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :test_users, if_exists: true
  end
end
