# frozen_string_literal: true

require 'sinatra/base'
require './lib/recipe'

class RecipeBook < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  post '/recipes/add' do
    Recipe.create(params[:url], params[:title])
    redirect '/recipes'
  end

  get '/recipes/:id/update' do
    @recipe_id = params[:id]
    erb :'recipes/update'
  end

  post '/recipes/:id' do
    Recipe.update(params[:id], params[:url], params[:title])
    redirect '/recipes'
  end


  run! if app_file == $PROGRAM_NAME
end
