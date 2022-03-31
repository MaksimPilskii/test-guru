class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end

  def change
    change_column_null(:users, :username, false)
  end
end
