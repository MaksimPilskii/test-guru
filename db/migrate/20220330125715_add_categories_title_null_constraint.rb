class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[7.0]
  def up
    change_column_null(:categories, :title, false)
  end
end
