class PoemsController < ApplicationController
  get '/poems' do
    @poems = Poem.all
    erb :"poems/index"
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