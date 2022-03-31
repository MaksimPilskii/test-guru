class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end

  def change
    change_column_null(:questions, :body, false)
  end
end
