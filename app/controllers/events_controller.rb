class EventsController < ApplicationController
    
    get '/events' do
        if logged_in?
            @events = Event.all
            @guest = current_user

            erb :'/events/home'
        else
            flash[:login] = "You must be logged in to do that!"
            redirect to '/login'
        end
    end

    get '/events/:id' do
        if event_not_found
            flash[:error] = "Invalid request."
            redirect '/events'
        elsif logged_in?
            @event = Event.find_by_id(params[:id])
            @current_user = current_user
            erb :'/events/show'
        else
            flash[:login] = "You must be logged in to do that!"
            redirect '/login'
        end
    end
end 