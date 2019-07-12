class Guest < ActiveRecord::Base
    has_secure_password

    has_many :event_guests
    has_many :events, through: :event_guests
end