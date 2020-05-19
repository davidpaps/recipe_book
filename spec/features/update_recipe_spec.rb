require 'web_helper'

feature "updating recipes" do
  scenario "allows a user to update a recipe, then viewable on the index page" do
    Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps', 'Pizza')
    view_recipes
    find("#updatePizza").click
    fill_in('title', with: 'Classic Pesto')
    fill_in('url', with: 'https://www.bbcgoodfood.com/recipes/classic-pesto')
    click_button('Update')
    expect(page).to have_link('Classic Pesto', href: 'https://www.bbcgoodfood.com/recipes/classic-pesto')
  end
end