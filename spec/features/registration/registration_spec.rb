require 'rails_helper'
RSpec.feature 'Signup', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit user_registration_path
    expect(page).to have_content 'Sign up'
  end

  it 'click the login error' do
    visit 'users/sign_up'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end

  it 'click the login error' do
    User.create(name: 'Hello', email: 'hello@example.com', password: 'password')
    visit 'users/sign_up'
    fill_in 'email', with: 'user@example.com'
    fill_in 'new-pwd', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Name can't be blank"
  end

  it 'click the login error' do
    visit 'users/sign_up'
    fill_in 'name', with: 'Hello'
    fill_in 'email', with: 'ali@example.com'
    fill_in 'new-pwd', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
