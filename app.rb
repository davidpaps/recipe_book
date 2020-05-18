# frozen_string_literal: true

require 'sinatra/base'

class RecipeBook < Sinatra::Base
  get '/' do
    'Recipe Book'
  end

  run! if app_file == $PROGRAM_NAME
end
