require 'recipe'

describe Recipe do

  describe '.all' do
    it 'returns all recipes' do
      Recipe.create('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
      Recipe.create('https://www.bbc.co.uk/food/recipes/freshpastadough_3067')
      Recipe.create('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')

      recipes = Recipe.all

      expect(recipes).to include('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
      expect(recipes).to include('https://www.bbc.co.uk/food/recipes/freshpastadough_3067')
      expect(recipes).to include('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')
    end
  end


  describe '.create' do
    it 'creates a newrecipe' do
      Recipe.create('https://www.bbcgoodfood.com/recipes/classic-pesto')
      expect(Recipe.all).to include('https://www.bbcgoodfood.com/recipes/classic-pesto')
    end
  end
end