require 'rails_helper'

RSpec.feature 'RecipeFood Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @food = Food.create(name: 'apple', measurementUnit: 'kg', price: 10, user: @user)
    @recipe = Recipe.create(name: 'Pizza', cookingTime: 1, preparationTime: 2, description: 'hgghgh', public: false,
                            user: @user)
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
    click_link('My recipes')
    click_link(@recipe.name)
    click_link('Add igredient')
  end

  it 'check the recipe_food path' do
    expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe.id))
  end

  it 'check the input elements' do
    expect(page).to have_selector('input')
  end

  it 'check the input elements' do
    expect(page).to have_selector('select')
  end

  it 'check the input elements' do
    expect(page).to have_content('apple')
  end
end
