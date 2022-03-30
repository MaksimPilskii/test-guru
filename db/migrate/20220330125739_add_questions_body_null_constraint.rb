class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[7.0]
  def up 
    change_column_null(:questions, :body, false)
  end
end
