
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Articles.all

    erb :index
  end

  post '/articles' do
    @article = Article.create(title: params[:title])

    redirect to '/articles/#{}@articles.id}'

  get '/articles/:id'  do
    @article = params[:id]

    erb :show
  end

end
