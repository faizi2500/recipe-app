require 'rails_helper'

RSpec.feature 'Food Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @food = Food.create(name: 'apple', measurementUnit: 'kg', price: 10, user: @user)
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
    click_link('Add food')
  end

  it 'user can see inputs and button' do
    expect(page).to have_current_path(new_food_path)
  end

  it 'click the login error' do
    fill_in 'name', with: 'eggs'
    fill_in 'measurement', with: 'kg'
    fill_in 'price', with: '10'
    click_button 'Create Food'
    expect(page).to have_content 'Food created successfully.'
  end

  it 'check the user image' do
    expect(page).to have_selector('input')
  end

  it 'check the user image' do
    expect(page).to have_selector('button')
  end

  it 'Navigate to the root path' do
    click_link('Back')
    expect(page).to have_current_path('/foods')
  end
end
