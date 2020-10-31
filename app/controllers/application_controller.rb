
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/article/new' do
    erb :new
  end

  get '/articles' do
    @articles = Articles.all

    erb :index
  end

  post '/articles' do
    Article.create(title: params[:title])
  end

  get '/articles/:id'  do
    @article = params[:id]

    erb :show
  end

end
