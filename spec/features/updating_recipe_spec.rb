require 'web_helper'

feature "updating recipes" do
  scenario "allows a user to update a recipe, then viewable on the index page" do
    add_recipes
    visit('/')
    click_button('View Recipes')
    expect(page).to have_link('Pizza', href: 'https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
  end
end