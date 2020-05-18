# frozen_string_literal: true

require 'sinatra/base'

class RecipeBook < Sinatra::Base
  get '/' do
    'Recipe Book'
  end

  get '/recipes' do
    @recipes = ["Pizza", "Pasta", "Cake"]
    erb :'recipes/index'
  end

  run! if app_file == $PROGRAM_NAME
end
