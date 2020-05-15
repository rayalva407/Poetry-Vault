class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/new'
  end

  post '/signup' do
    binding.pry
    user = User.new(params)
    if user.save
      redirect to '/poems'
    else
      redirect to '/signup'
    end
  end
end