# frozen_string_literal: true
require 'web_helper'

feature 'viewing recipes' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content('Recipe Book')
  end

  scenario 'viewing the recipes' do
    add_recipes
    view_recipes
    expect(page).to have_link('Pizza', href: 'https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
    expect(page).to have_link('Pasta', href: 'https://www.bbc.co.uk/food/recipes/freshpastadough_3067')
    expect(page).to have_link('Cake', href: 'https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')
  end
end
