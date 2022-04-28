# frozen_string_literal: true

class CreateTestUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :test_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreigh_key: true

      t.timestamps
    end
  end
end
