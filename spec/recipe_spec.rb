require 'recipe'

describe Recipe do

  describe '#all' do
    it 'returns all recipes' do
      recipes = Recipe.all

      expect(recipes).to include('https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps')
      expect(recipes).to include('https://www.bbc.co.uk/food/recipes/freshpastadough_3067')
      expect(recipes).to include('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')
    end
  end
end