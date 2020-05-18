feature 'viewing recipes' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("Recipe Book")
  end

  scenario 'viewing the recipes' do

    connection = PG.connect(dbname: 'recipebooktest')

    connection.exec("INSERT INTO recipes (url) VALUES ('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps');")
    connection.exec("INSERT INTO recipes (url) VALUES ('https://www.bbc.co.uk/food/recipes/freshpastadough_3067');")
    connection.exec("INSERT INTO recipes (url) VALUES ('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070');")

    visit('/recipes')
    expect(page).to have_content("https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps")
    expect(page).to have_content("https://www.bbc.co.uk/food/recipes/freshpastadough_3067")
    expect(page).to have_content("https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070")
  end
end