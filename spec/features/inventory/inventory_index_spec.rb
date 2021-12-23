require 'rails_helper'

RSpec.feature 'Inventory Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @inventory = Inventory.create(name: 'kitchen', description: 'New inventory', user_id: @user.id)
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
    click_on('My inventories')
  end

  it 'user can see inputs and button' do
    expect(page).to have_current_path(inventories_path)
  end

  it 'show Inventories heading' do
    expect(page).to have_content 'Inventories by'
  end

  it 'show inventory name' do
    expect(page).to have_content @inventory.name
  end

  it 'show inventory description' do
    expect(page).to have_content @inventory.description
  end

  it 'show inventory description' do
    click_on('Check Inventory')
    expect(page).to have_current_path inventory_inventory_foods_path(@inventory.id)
  end

  it 'form inputs' do
    click_on('Create New')
    expect(page).to have_button('Close')
  end
end
