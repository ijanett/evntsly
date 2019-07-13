class EventGuestsController < ApplicationController 

    post '/event_guests' do
        EventGuest.find_or_create_by(params[:event_guest])
        guest = Guest.find(params[:event_guest][:guest_id])
        
        redirect "/#{guest.username}"
    end

    delete '/delete/:id' do
        event = EventGuest.find_by(params[:event_guest])
        guest = current_user
        event.delete
        redirect "/#{guest.username}"
    end
end