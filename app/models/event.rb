class Event < ActiveRecord::Base
    has_many :event_guests
    has_many :guests, through: :event_guests
end