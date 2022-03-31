class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, null: false, foreign_key: {to_table: :tests}

      t.timestamps
    end
  end
end
