class GuestsController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect '/events'
        else
        
            erb :'/guests/signup'
        end
    end

    post '/signup' do
        @guest = Guest.find_by(username: params[:username].downcase)
        if @guest
            flash[:warning] = "Username already exists."
            redirect '/signup'
        else
            @guest = Guest.create(username: params[:username], email: params[:email], password: params[:password])
            session[:guest_id] = @guest.id
        
            redirect '/events'
        end
    end

    get '/account' do
        if !logged_in?
            flash[:login] = "You must be logged in to do that!"
            redirect '/login'
        else
            @guest = Guest.find(session[:guest_id])

            erb :'/guests/account'
        end
    end

    get '/account/edit' do
        if current_user
            erb :'/guests/edit'
        else
            redirect '/login'
        end
    end

    patch '/account' do
        @guest = Guest.find_by(username: params[:username].downcase)
        if @guest
            flash[:warning] = "Username already exists."
            redirect '/account/edit'
        else
            @guest.update(username: params[:username], email: params[:email])
            redirect '/account'
        end
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
            flash[:invalid] = "Invalid username or password."
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
            flash[:login] = "You must be logged in to do that!"
            redirect "/login"
        elsif user_not_found
            flash[:error] = "Invalid request."
            redirect "/#{current_user.username}"
        else logged_in?
            @guest = Guest.find_by(username: params[:username])
            
            if @guest.username != current_user.username
                flash[:error] = "Invalid request."
                redirect "/#{current_user.username}"
            else
                @guest_events = @guest.events
            end
            
            erb :'guests/show'
        end   
    end

end