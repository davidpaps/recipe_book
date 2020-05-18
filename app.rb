# frozen_string_literal: true

require 'sinatra/base'
require './lib/recipe'

class RecipeBook < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  run! if app_file == $PROGRAM_NAME
end



