class GuestsController < ApplicationController

    get '/signup' do
        
        erb :'/guests/signup'
    end

    post '/signup' do
        @guest = Guest.create(username: params[:username], email: params[:email], password: params[:password])
        # session[:guest_id] = @guest.id
        binding.pry
        erb :'/events'
    end
end