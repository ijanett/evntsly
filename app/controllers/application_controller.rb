require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "evntsly_secret"
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
  end
  
end
