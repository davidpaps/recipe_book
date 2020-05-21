# frozen_string_literal: true

require 'sinatra/base'
require './lib/recipe'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class RecipeBook < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  post '/recipes/add' do
    if params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
       Recipe.create(params[:url], params[:title])
    else
      flash[:notice] = "You Must Submit a Valid URL!"
    end
    redirect '/recipes'
  end

  get '/recipes/:id/update' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/update'
  end

  delete '/recipes/:id' do
    Recipe.delete(params[:id])
    redirect '/recipes'
  end

  patch '/recipes/:id' do
    Recipe.update(params[:id], params[:url], params[:title])
    redirect '/recipes'
  end

  run! if app_file == $PROGRAM_NAME
end
