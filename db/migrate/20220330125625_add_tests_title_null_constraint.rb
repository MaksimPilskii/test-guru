class AddTestsTitleNullConstraint < ActiveRecord::Migration[7.0]
  def up
    change_column_default :tests, :level, from: null, to: 0
  end
end
