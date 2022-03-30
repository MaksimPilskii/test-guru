class AddUsersUsernameNullConstraint < ActiveRecord::Migration[7.0]
  def up 
    change_column_null(:users, :username, false)
  end
end
