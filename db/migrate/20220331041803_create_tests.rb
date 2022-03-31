class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    change_column_null(:tests, :title, false)
    change_column_default :tests, :level, from: nil, to: 0
  end
end
