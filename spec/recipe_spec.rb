# frozen_string_literal: true

require 'recipe'
require 'database_helpers'
require 'web_helper'

describe Recipe do

  before(:each) do
    add_recipes
  end

  describe '.all' do
    it 'returns all recipes' do
      recipes = Recipe.all
      expect(recipes.length).to eq(3)
      expect(recipes[0]).to be_a(Recipe)
      expect(recipes[1].title).to eq('Pasta')
      expect(recipes[2].url).to eq('https://www.bbc.co.uk/food/recipes/easy_chocolate_cake_31070')
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

  describe '.update' do
    it 'updates an existing recipe' do
      recipes = Recipe.all
      Recipe.update(recipes[0].id, 'https://www.bbc.co.uk/food/recipes/pizzadoughbase_70980', "Pizza Dough")
      new_recipes = Recipe.all
      expect(new_recipes[-1].title).to eq("Pizza Dough")
      expect(new_recipes[-1].url).to eq("https://www.bbc.co.uk/food/recipes/pizzadoughbase_70980")
    end
  end
end
