class AddAnswersCorrectDefaultConstraint < ActiveRecord::Migration[7.0]
  def up 
    change_column_default :answers, :correct, from: nil, to: false
  end
end
