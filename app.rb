# frozen_string_literal: true

require 'sinatra/base'
require './lib/recipe'
require './lib/comment'
require './database_connection_setup'
require 'sinatra/flash'

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
    flash[:notice] = "You Must Submit a Valid URL!" unless Recipe.create(params[:url], params[:title])
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

  get '/recipes/:id/comments/new' do
    @recipe_id = params[:id]
    erb :'comments/add'
  end

  post '/recipes/:id/comments' do
    Comment.create(params[:comment], params[:id])
    redirect '/recipes'
  end
  
  run! if app_file == $PROGRAM_NAME
end
