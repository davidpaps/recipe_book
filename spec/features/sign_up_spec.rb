# frozen_string_literal: true

feature 'sign up' do
  scenario ' a user can sign up' do
    visit('/users/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password')
    click_button('Sign Up')
    expect(page).to have_content 'Welcome, test@test.com'
  end
end
