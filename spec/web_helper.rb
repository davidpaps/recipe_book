# frozen_string_literal: true

def add_recipes
  Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps', 'Pizza')
  Recipe.create('https://www.bbc.co.uk/food/recipes/freshpastadough_3067', 'Pasta')
  Recipe.create('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070', 'Cake')
end

def view_recipes
  visit('/')
  click_button('View Recipes')
end

def create_user
  User.create('test@test.com', 'password')
end
