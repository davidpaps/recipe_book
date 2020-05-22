# frozen_string_literal: true

require 'sinatra/base'
require './lib/recipe'
require './lib/comment'
require './lib/user'
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
    @user = User.find(session[:user_id])
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  post '/recipes/add' do
    unless Recipe.create(params[:url], params[:title])
      flash[:notice] = 'You Must Submit a Valid URL!'
    end
    redirect('/recipes')
  end

  get '/recipes/:id/update' do
    @recipe = Recipe.find(params[:id])
    erb :'recipes/update'
  end

  delete '/recipes/:id' do
    Recipe.delete(params[:id])
    redirect('/recipes')
  end

  patch '/recipes/:id' do
    Recipe.update(params[:id], params[:url], params[:title])
    redirect('/recipes')
  end

  get '/recipes/:id/comments/new' do
    @recipe_id = params[:id]
    erb :'comments/add'
  end

  post '/recipes/:id/comments' do
    Comment.create(params[:comment], params[:id])
    redirect('/recipes')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect('/recipes')
  end

  get '/sessions/new'do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(result[0][:id], result[0][:email], result[0][:password])
    session[:user_id] = user.id
    redirect('/recipes')
  end

  run! if app_file == $PROGRAM_NAME
end
