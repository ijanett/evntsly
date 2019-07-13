class EventsController < ApplicationController
    
    get '/events' do
        if logged_in?
            @events = Event.all
            @guest = current_user

            erb :'/events/home'
        else
            redirect to '/login'
        end
    end

    get '/events/:id' do
        if event_not_found
            redirect '/events'
        elsif logged_in?
            @event = Event.find_by_id(params[:id])
            @current_user = current_user
            erb :'/events/show'
        else
            redirect '/login'
        end
    end
end 