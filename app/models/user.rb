class User < ActiveRecord::Base
    has_many :trips
    has_many :flights, through: :trips

    def self.find_user_by_username(username)
        self.all.find_by(username: username)
    end

    def self.verify_login(username, password)
        self.all.where(username: username, password: password).exists?
    end

    def add_booking(flight_id)
        Trip.create(flight_id: flight_id, user_id: self.id)
    end

    def see_bookings
        Trip.where("user_id = ?", self.id)
    end

end