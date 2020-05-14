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
    #binding.pry
    user = User.find_by_id(params[:user_id])
    poem = user.poems.build(params)
    if poem.save
      redirect to '/poems/:id'
    else
      redirect to '/poems/new'
    end
  end

  get '/poems/:id/edit' do
    @users = User.all
    @poem = Poem.find_by_id(params[:id])
    erb :"poems/edit"
  end

  patch '/poems/:id' do
    binding.pry
    @poem = Poem.find_by_id(params[:id])
    if @poem.update(title: params[:title], content: params[:body])
      redirect to "poems/#{@post.id}"
    else
      redirect to "poems/#{@post.id}/edit"
    end
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