require 'recipe'
require 'database_helpers'

describe Recipe do

  describe '.all' do
    it 'returns all recipes' do
      Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps', "Pizza")
      Recipe.create('https://www.bbc.co.uk/food/recipes/freshpastadough_3067', "Pasta")
      Recipe.create('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070', "Cake")

      recipes = Recipe.all

      expect(recipes.length).to eq(3)
      expect(recipes[0]).to be_a(Recipe)
      expect(recipes[1].title).to eq("Pasta")
      expect(recipes[2].url).to eq("https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070")
    end
  end


  describe '.create' do
    it 'creates a newrecipe' do
      recipe = Recipe.create('https://www.bbcgoodfood.com/recipes/classic-pesto', 'Classic Pesto')
      persisted_data = persisted_data(recipe.id)

      expect(recipe.id).to eq(persisted_data['id'])
      expect(recipe).to be_a(Recipe)
      expect(recipe.url).to eq('https://www.bbcgoodfood.com/recipes/classic-pesto')
      expect(recipe.title).to eq('Classic Pesto')
    end
  end
end