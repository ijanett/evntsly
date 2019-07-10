class GuestsController < ApplicationController

    get '/signup' do
        
        erb :'/guests/signup'
    end

    post '/signup' do
        @guest = Guest.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
        # session[:guest_id] = @guest.id
        binding.pry
        erb :'/events'
    end
end