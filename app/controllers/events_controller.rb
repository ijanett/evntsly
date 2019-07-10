class EventsController < ApplicationController
    
    get '/events' do
        if logged_in?
            @events = Event.all

            erb :'/events/home'
        else
            redirect to '/login'
        end
    end
end 