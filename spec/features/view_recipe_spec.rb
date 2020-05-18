feature 'viewing recipes' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("Recipe Book")
  end

  scenario 'viewing the recipes' do
    
    Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps', "Pizza")
    Recipe.create('https://www.bbc.co.uk/food/recipes/freshpastadough_3067', "Pasta")
    Recipe.create('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070', "Cake")
    
    visit('/')
    click_button('View Recipes')
    # expect(page).to have_content("https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps")
    # expect(page).to have_content("https://www.bbc.co.uk/food/recipes/freshpastadough_3067")
    # expect(page).to have_content("https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070")
    expect(page).to have_link('Pizza', href: 'https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
    expect(page).to have_link('Pasta', href: 'https://www.bbc.co.uk/food/recipes/freshpastadough_3067')
    expect(page).to have_link('Cake', href: 'https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')
  end
end