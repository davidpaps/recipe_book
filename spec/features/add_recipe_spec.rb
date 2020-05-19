# frozen_string_literal: true

feature 'adding recipes' do
  scenario 'add a recipe on the index page' do
    visit('/')
    fill_in('title', with: 'Classic Pesto')
    fill_in('url', with: 'https://www.bbcgoodfood.com/recipes/classic-pesto')
    click_button('Add Recipe')
    expect(page).to have_link('Classic Pesto', href: 'https://www.bbcgoodfood.com/recipes/classic-pesto')
  end
end
