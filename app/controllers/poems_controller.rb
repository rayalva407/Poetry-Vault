class PoemsController < ApplicationController

  get '/poems' do
    if logged_in?
      @poems = current_user.poems
      erb :"poems/index"
    else
      redirect '/login'
    end
  end

  get '/poems/new' do
    if logged_in?
      erb :"poems/new"
    else
      redirect '/login'
    end
  end

  post '/poems' do
    if logged_in?
      poem = current_user.poems.build(params)
      if poem.save
        redirect to '/poems/:id'
      else
        redirect to '/poems/new'
      end
    else
      redirect '/login'
    end
  end

  get '/poems/:id/edit' do
    if logged_in?
      @poem = current_user.poems.find_by_id(params[:id])
      if @poem
      erb :"poems/edit"
      else
        redirect to '/poems'
      end
    else
      redirect to '/login'
    end
  end

  patch '/poems/:id' do
    if logged_in?
      @poem = current_user.poems.find_by_id(params[:id])
      if @poem
        if @poem.update(title: params[:title], content: params[:content])
          redirect to "poems/#{@poem.id}"
        else
          redirect to "poems/#{@poem.id}/edit"
        end
      else
        redirect to '/poems'
      end
    else
      redirect to '/login'
    end
  end

  get '/poems/:id' do
    if logged_in?
      @poem = current_user.poems.find_by_id(params[:id])
      if @poem
        erb :"poems/show"
      else
        redirect to '/poems'
      end
    else
      redirect to '/login'
    end
  end

  delete '/poems/:id' do
    if logged_in?
      @poem = current_user.poems.find_by_id(params[:id])
      if @poem
        @poem.delete
      end
      redirect to '/poems'
    else
      redirect to '/login'
    end
  end
end