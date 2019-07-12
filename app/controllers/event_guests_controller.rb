class EventGuestsController < ApplicationController 

    post '/event_guests' do
        EventGuest.find_or_create_by(params[:event_guest])
        guest = Guest.find(params[:event_guest][:guest_id])

        redirect "/#{guest.username}"
    end

    delete '/delete/:id' do
        # guest_event = EventGuest.find_by(params[:event_guest])
        # guest = Guest.find(params[:event_guest][:guest_id])
        # guest_event.delete
    # binding.pry
        event = EventGuest.find_by(params[:event_guest])
        guest = current_user
#  binding.pry       
        event.delete
        redirect "/#{guest.username}"
    end
end