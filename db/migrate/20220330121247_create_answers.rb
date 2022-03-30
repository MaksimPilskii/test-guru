class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :Answers do |t|
      t.text :body
      t.boolean :correct
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
