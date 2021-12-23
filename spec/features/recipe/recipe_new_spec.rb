require 'rails_helper'

RSpec.feature 'Food Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
    visit recipes_path
    click_link('Add recipe')
  end

  it 'user can see inputs and button' do
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'creates the recipe successfully' do
    fill_in 'name', with: 'Wonderful eggs'
    fill_in 'cookingTime', with: '10'
    fill_in 'preparationTime', with: '10'
    fill_in 'description', with: 'wow wow'
    click_button 'Create Recipe'
    expect(page).to have_content 'Recipe successfully created'
  end

  it 'Navigate automatically to the root recipe page after creating it' do
    fill_in 'name', with: 'Wonderful eggs'
    fill_in 'cookingTime', with: '10'
    fill_in 'preparationTime', with: '10'
    fill_in 'description', with: 'wow wow'
    click_button 'Create Recipe'
    expect(page).to have_current_path(recipe_path(Recipe.find_by(name: 'Wonderful eggs')))
  end
end
