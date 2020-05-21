# frozen_string_literal: true

require 'web_helper'

feature 'adding and viewing comments on recipes' do
  scenario 'add a comment to a recipe' do
    add_recipes
    visit('/recipes')
    find('#commentPizza').click
    fill_in 'comment', with: 'This is a comment'
    click_button 'Submit Comment'
    expect(page).to have_content('This is a comment')
  end
end
