require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "e86ecddf4fd803e692ec4d19a8d49090e2cf54dd"
  end

  get "/" do
    erb :index
  end
end
