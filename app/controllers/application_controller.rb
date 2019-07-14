require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "evntsly_secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect '/events'
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!session[:guest_id]
    end

    def current_user
      if logged_in?
        Guest.find(session[:guest_id])
      else 
        nil
      end
    end

    def user_not_found
      if logged_in?
        !Guest.exists?(params)
      end
    end

    def event_not_found
      if logged_in?
        !Event.exists?(params)
      end
    end

    def invalid_event_guest
        !EventGuest.exists?(params)
    end
  end
  
end
