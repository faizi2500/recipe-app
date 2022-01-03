require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  user = User.create(name: 'Cork', email: 'example@mail.com', password: 'password')
  inventory = Inventory.new(name: 'kitchen', description: 'pizza', user_id: user.id)
  food = Food.new(name: 'apple', measurementUnit: 'kg', price: 25, user_id: user.id)

  before(:each) do
    inventory.save
    food.save
    @inventory_food = InventoryFood.create(quantity: 15, inventory_id: inventory.id, food_id: food.id)
  end

  it 'nil title should be invalid' do
    @inventory_food.quantity = nil
    expect(@inventory_food).to_not be_valid
  end
end
