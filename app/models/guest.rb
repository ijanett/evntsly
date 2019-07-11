class Guest < ActiveRecord::Base
    has_secure_password

    has_many :event_guests
    has_many :events, through: :event_guests

    def slug
        username.downcase.gsub(" ","-")
    end

end