# frozen_string_literal: true

require 'web_helper'

feature 'updating recipes' do
  scenario 'allows a user to update a recipe, then viewable on the index page' do
    add_recipe
    view_recipes
    click_button('Update Classic Pesto')
    fill_in('title', with: 'Pizza')
    fill_in('url', with: 'https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
    click_button('Update')
    expect(page).to have_link('Pizza', href: 'https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
  end
end
