class AddAnswersBodyNullConstraint < ActiveRecord::Migration[7.0]
  def up
    change_column_null(:answers, :body, false)
  end
end
