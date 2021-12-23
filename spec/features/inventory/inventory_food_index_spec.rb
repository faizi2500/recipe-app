require 'rails_helper'
RSpec.feature 'Inventory Food Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @inventory = Inventory.create(name: 'Kitchen', description: 'New inventory', user_id: @user.id)
    @food = Food.create(name: 'apple', measurementUnit: 'kg', price: 10, user: @user)
    @inventory_food = InventoryFood.create(quantity: 25, food_id: @food.id, inventory_id: @inventory.id)
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
    click_on('My inventories')
    click_on('Check Inventory')
  end

  it 'verify path' do
    expect(page).to have_current_path inventory_inventory_foods_path(@inventory.id)
  end

  it 'check status' do
    expect(page).to have_http_status(:ok)
  end

  it 'show heading' do
    expect(page).to have_content(@inventory.name)
  end

  it 'show inventory food list' do
    expect(page).to have_content @food.name
  end

  it 'show form button' do
    click_on('Add Food')
    expect(page).to have_button('Close')
  end
end
