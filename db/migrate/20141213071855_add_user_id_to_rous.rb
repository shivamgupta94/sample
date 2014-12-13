class AddUserIdToRous < ActiveRecord::Migration
  def change
    add_column :rous, :user_id, :integer
    add_index :rous, :user_id
  end
end
