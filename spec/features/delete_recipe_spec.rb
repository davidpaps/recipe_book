# frozen_string_literal: true

require 'web_helper'

feature 'deleting recipes' do
  scenario 'allows a user to delete a recipe, then go back to index page' do
    add_recipes
    view_recipes
    find('#deletePizza').click
    expect(page).not_to have_link('Pizza', href: 'https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
  end
end
