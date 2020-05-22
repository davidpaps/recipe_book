# frozen_string_literal: true

feature "checking url's" do
  scenario 'recipe must be a valid URL' do
    visit('/recipes')
    fill_in('title', with: 'Gnocchi')
    fill_in('url', with: 'bbcgoodfood com/recipes/roast-mushroom-gnocchi')
    click_button('Add Recipe')
    expect(page).not_to have_content('bbcgoodfood com/recipes/roast-mushroom-gnocchi')
    expect(page).to have_content('You Must Submit a Valid URL!')
  end
end
