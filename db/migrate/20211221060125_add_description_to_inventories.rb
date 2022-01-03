class AddDescriptionToInventories < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :description, :string
  end
end
