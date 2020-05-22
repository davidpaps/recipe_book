# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/comment'
require './lib/recipe'
require './lib/user'

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
    flash[:notice] = 'Recipe Deleted!'
    redirect('/recipes')
  end

  patch '/recipes/:id' do
    Recipe.update(params[:id], params[:url], params[:title])
    flash[:notice] = 'Recipe Updated!'
    redirect('/recipes')
  end

  get '/recipes/:id/comments/new' do
    @recipe_id = params[:id]
    erb :'comments/add'
  end

  post '/recipes/:id/comments' do
    Comment.create(params[:comment], params[:id])
    flash[:notice] = 'Comment Added!'
    redirect('/recipes')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    flash[:notice] = 'Account Sucessfully Created!'
    redirect('/recipes')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Sign In Sucessfull!'
      redirect('/recipes')
    else
      flash[:notice] = 'Access Denied - Please check your Email/Password!'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have Signed Out!'
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
