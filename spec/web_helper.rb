# frozen_string_literal: true

def add_recipe
  Recipe.create('https://www.bbcgoodfood.com/recipes/classic-pesto', 'Classic Pesto')
end

def add_recipes
  Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps', 'Pizza')
  Recipe.create('https://www.bbc.co.uk/food/recipes/freshpastadough_3067', 'Pasta')
  Recipe.create('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070', 'Cake')
end

def create_user
  User.create('test@test.com', 'password')
end

def sign_in
  visit('/sessions/new')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'password')
  click_button('Sign In')
end
