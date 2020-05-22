# frozen_string_literal: true

require 'web_helper'

feature 'authentication' do
  scenario 'a user can sign in' do
    create_user
    visit('/sessions/new')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign In')
    expect(page).to have_content('Welcome test@test.com!')
  end

  scenario 'error thrown if email is incorrect' do
    create_user
    visit('/sessions/new')
    fill_in(:email, with: 'wrongtest@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign In')
    expect(page).not_to have_content('Welcome test@example.com!')
    expect(page).to have_content('Access Denied - Please check your Email/Password!')
  end

  scenario 'error thrown if password is incorrect' do
    create_user
    visit('/sessions/new')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign In')
    expect(page).not_to have_content('Welcome test@example.com!')
    expect(page).to have_content('Access Denied - Please check your Email/Password!')
  end

  scenario 'a user can sign out' do
    create_user
    visit('/sessions/new')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign In')
    click_button('Sign Out')
    expect(page).not_to have_content('Welcome test@example.com!')
    expect(page).to have_content('You have Signed Out!')
  end
end
