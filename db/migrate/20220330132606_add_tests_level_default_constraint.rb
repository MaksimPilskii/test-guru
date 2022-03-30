class AddTestsLevelDefaultConstraint < ActiveRecord::Migration[7.0]
  def up 
    change_column_default :tests, :level, from: nil, to: 0
  end
end
