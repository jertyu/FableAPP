class AddUserIdsToTales < ActiveRecord::Migration[5.0]
  def change
    add_column :tales, :user_id, :integer
    add_index :tales, :user_id
  end
end
