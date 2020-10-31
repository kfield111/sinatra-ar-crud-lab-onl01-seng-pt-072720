
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
    data = params
    @article = Article.create(params)

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id'  do
    @article = Article.find_by(params[:id])

    erb :show
  end

end
