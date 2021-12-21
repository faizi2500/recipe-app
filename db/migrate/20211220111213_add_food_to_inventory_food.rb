class AddFoodToInventoryFood < ActiveRecord::Migration[6.1]
  def change
    add_reference :inventory_foods, :food, null: false, foreign_key: true
  end
end
