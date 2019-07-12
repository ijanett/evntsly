class EventGuestsController < ApplicationController 

    post '/event_guests' do
        EventGuest.find_or_create_by(params[:event_guest])
        guest = Guest.find(params[:event_guest][:guest_id])

        redirect "/#{guest.username}"
    end

    delete '/event_guests/delete' do
        # guest_event = EventGuest.find_by(params[:event_guest])
        # guest = Guest.find(params[:event_guest][:guest_id])
        # guest_event.delete
    
        guest = Guest.find_by_id(params[:event_guest][:guest_id])
        event = guest.events.find(params[:event_guest][:event_id])
        binding.pry
        event.delete
        redirect "/#{guest.username}"
    end
end