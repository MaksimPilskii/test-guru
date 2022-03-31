class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :body

      t.timestamps
    end
  end

  def change
    change_column_null(:categories, :title, false)
  end
end
