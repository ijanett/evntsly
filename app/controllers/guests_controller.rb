class GuestsController < ApplicationController

    get '/signup' do
        
        erb :'/guests/signup'
    end

    post '/signup' do
        @guest = Guest.create(username: params[:username], email: params[:email], password: params[:password])
        session[:guest_id] = @guest.id
        # binding.pry
        redirect '/events'
    end

    get '/login' do
        if logged_in?
            redirect '/events'
        else
            erb :'/guests/login'
        end
    end

    post '/login' do
        @guest = Guest.find_by(username: params[:username])
# binding.pry
        if @guest && @guest.authenticate(params[:password])
            session[:guest_id] = @guest.id
            redirect '/events'
        else
            redirect '/login'
        end
    end

    get '/:username' do
        @guest = Guest.find_by(username: params[:username])
        @guest_events = @guest.events
# binding.pry
        erb :'guests/show'
    end

    get '/logout' do
        if logged_in?
            # binding.pry
            session.clear
            erb :'/guests/login'
        else
            redirect '/'
        end
    end
end