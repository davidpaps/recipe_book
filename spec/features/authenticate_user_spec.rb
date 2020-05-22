# frozen_string_literal: true

require 'web_helper'

feature 'authentication' do
  scenario 'a user can sign in' do
    create_user
    visit('/sessions/new')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Welcome test@test.com!')
  end

  scenario 'error thrown if email is incorrect' do
    create_user
    visit('/sessions/new')
    fill_in(:email, with: 'wrongtest@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(page).not_to have_content('Welcome test@example.com!')
    expect(page).to have_content('Access Denied - Please check your Email/Password!')
  end
end
