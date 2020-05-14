class PoemsController < ApplicationController
  get '/poems' do
    @poems = Poem.all
    erb :"poems/index"
  end

  get '/poems/new' do
    @users = User.all
    erb :"poems/new"
  end

  post '/poems' do
    binding.pry
    user = User.find_by_id(params[:user_id])
    poem = Poem.create(:title => params[:title], :content => params[:content], :user_id => params[:user_id])
    
    redirect to '/poems/:id'
  end

  get '/poems/:id' do
    @poem = Poem.find_by_id(params[:id])
    if @poem
      erb :"poems/show"
    else
      redirect to '/poems'
    end
  end
end