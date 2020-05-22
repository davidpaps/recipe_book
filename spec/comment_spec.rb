# frozen_string_literal: true

require 'comment'
require 'recipe'
require 'web_helper'

describe Comment do
  describe '.comment' do
    it 'creates a new comment' do
      recipe = add_recipe
      recipes = Recipe.all
      comment = Comment.create('This is a test comment', recipes[0].id)
      comments = Comment.all

      expect(comment).to be_a Comment
      expect(comments[0].description).to eq 'This is a test comment'
      expect(comments[0].recipe_id).to eq recipes[0].id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
      recipe = add_recipe
      Comment.create('This is a test comment', recipe.id)
      Comment.create('This is a second test comment', recipe.id)

      comments = Comment.where(recipe.id)
      comment = comments.first

      expect(comments.length).to eq 2
      expect(comment.description).to eq 'This is a test comment'
      expect(comment.recipe_id).to eq recipe.id
    end
  end

  describe '.create' do
    it 'adds a new comment to the database' do
      recipe = add_recipe
      recipes = Recipe.all
      Comment.create('Test comment', recipes[0].id)
      comments = Comment.all
      expect(comments[-1].description).to eq('Test comment')
    end
  end
end
