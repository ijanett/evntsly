class EventsController < ApplicationController
    
    get '/events' do
        if logged_in?
            @events = Event.all
            @guest = current_user
# binding.pry
            erb :'/events/home'
        else
            redirect to '/login'
        end
    end

    # post '/events' do
    #     @events = Event.all
    #     @guest = Guest.find_by(id: params[:id])

    #     erb :'/events/home'
    # end

    get '/events/:id' do
        if logged_in?
            @event = Event.find_by_id(params[:id])
            @current_user = current_user
            erb :'/events/show'
        else
            redirect '/login'
        end
    end
end 