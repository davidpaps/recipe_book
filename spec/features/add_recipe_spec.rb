feature "adding recipes" do
  scenario 'add a recipe on the index page' do
    visit('/')
    fill_in('url', with: 'https://www.bbcgoodfood.com/recipes/classic-pesto') 
    click_button('Add Recipe')
    expect(page).to have_content("https://www.bbcgoodfood.com/recipes/classic-pesto")
  end
end