require 'rails_helper'

RSpec.feature 'Recipe Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    @recipe = Recipe.create(user: @user, name: 'Wonderful cake', cookingTime: 5.5, preparationTime: 12.6,
                            description: 'Test the wondrful cake', public: true)
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pwd', with: 'password'
    click_button 'Log in'
    visit recipes_path
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(root_path)
  end

  it 'show the button of adding a recipe' do
    expect(page).to have_content 'Add recipe'
  end

  it 'show recipe name' do
    expect(page).to have_content @recipe.name
  end

  it 'show recipe description' do
    expect(page).to have_content @recipe.description
  end

  it 'check the delete butto' do
    expect(page).to have_content 'Remove'
  end

  it 'Navigate to the recipe page' do
    find_link("recipe_#{@recipe.id}").click
    expect(page).to have_current_path(recipe_path(@recipe))
  end
end
