class AddUserToInventory < ActiveRecord::Migration[6.1]
  def change
    add_reference :inventories, :user, null: false, foreign_key: true
  end
end
