require 'recipe'

describe Recipe do

  describe '.all' do
    it 'returns all recipes' do
      recipe =  Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps', "Pizza")
      Recipe.create('https://www.bbc.co.uk/food/recipes/freshpastadough_3067', "Pasta")
      Recipe.create('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070', "Cake")

      recipes = Recipe.all

      # expect(recipes).to include('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
      # expect(recipes).to include('https://www.bbc.co.uk/food/recipes/freshpastadough_3067')
      # expect(recipes).to include('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')

      expect(recipes.length).to eq(3)
      expect(recipes[0]).to be_a(Recipe)
      # expect(recipes[0].id).to eq(recipe.id)
      expect(recipes[0].title).to eq("Pizza")
      expect(recipes[0].url).to eq("https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps")


    end
  end


  describe '.create' do
    it 'creates a newrecipe' do
      recipe = Recipe.create('https://www.bbcgoodfood.com/recipes/classic-pesto', 'Classic Pesto')
      expect(recipe[0]['url']).to eq('https://www.bbcgoodfood.com/recipes/classic-pesto')
      expect(recipe[0]['title']).to eq('Classic Pesto')
    end
  end
end