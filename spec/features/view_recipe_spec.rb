feature 'viewing recipes' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Recipe Book"
  end
end