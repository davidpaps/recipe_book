feature 'viewing recipes' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("Recipe Book")
  end

  scenario 'viewing the recipes' do
    visit('/recipes')
    expect(page).to have_content("Pizza")
    expect(page).to have_content("Pasta")
    expect(page).to have_content("Cake")
  end
end