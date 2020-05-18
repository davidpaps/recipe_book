require 'recipe'

describe Recipe do

  describe '#all' do
    it 'returns all recipes' do
      recipes = Recipe.all

      expect(recipes).to include('Pizza')
      expect(recipes).to include('Pasta')
      expect(recipes).to include('Cake')
    end
  end
end