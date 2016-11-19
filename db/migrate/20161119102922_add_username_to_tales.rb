class AddUsernameToTales < ActiveRecord::Migration[5.0]
  def change
    add_column :tales, :username, :integer
    add_index :tales, :username
  end
end