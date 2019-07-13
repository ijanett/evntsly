class GuestsController < ApplicationController

    get '/signup' do
        
        erb :'/guests/signup'
    end

    post '/signup' do
        @guest = Guest.create(username: params[:username], email: params[:email], password: params[:password])
        session[:guest_id] = @guest.id
        
        redirect '/events'
    end

    get '/account' do
        @guest = Guest.find(session[:guest_id])

        erb :'/guests/account'
    end

    get '/account/edit' do
        if current_user
            erb :'/guests/edit'
        else
            redirect '/login'
        end
    end

    patch '/account' do
        @guest = Guest.find(session[:guest_id])
        @guest.update(username: params[:username], email: params[:email])

        redirect '/account'
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

        if @guest && @guest.authenticate(params[:password])
            session[:guest_id] = @guest.id
            redirect '/events'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

    get '/:username' do
        if !logged_in?
            redirect "/login"
        elsif user_not_found
            redirect "/#{current_user.username}"
        else logged_in?
            @guest = Guest.find_by(username: params[:username])
            
            if @guest.username != current_user.username
             redirect "/#{current_user.username}"
        
            else
                @guest_events = @guest.events
            end
            
            erb :'guests/show'
        end   
    end

end