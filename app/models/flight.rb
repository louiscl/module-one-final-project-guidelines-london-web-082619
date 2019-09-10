class Flight < ActiveRecord::Base
    has_many :trips
    has_many :users, through: :trips


    def self.find_by_date(date)
        Flight.select{|f| date == f.date_time.strftime("%Y %m %d")}
    end

    def self.find_by_date_origin_destination(origin, destination, date)
        flight_date = Flight.find_by_date(date)
        # self.find_by(origin: origin, destination: destination, date_time: Flight.find_by_date(date))
        flight_date.select{|f| 
        f.origin == origin &&
        f.destination == destination}

        # Flight.select{|f| 
        # date == f.date_time.strftime("%Y %m %d")
        # origin == f.origin
        # destination == destination 
        # }
    end

end