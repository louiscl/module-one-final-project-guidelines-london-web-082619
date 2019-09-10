class Cli


def initialize
    @prompt = TTY::Prompt.new
    @user = nil
end

def intro
    puts "Welcome to your personal flight booker assistant"
end

def login
        username = @prompt.ask('Enter username')
        password = @prompt.mask('Enter password')
        if User.verify_login(username, password)
           @user = User.find_user_by_username(username)
        else
            puts "error message"
        end
     @user
end

def register
        first_name = @prompt.ask('What is your first name?')
        last_name = @prompt.ask('What is your last name?')
        age = @prompt.ask('How old are you?')
        username = @prompt.ask('Create a username')
        password = @prompt.mask('Create a password')
        @user = User.create(first_name: first_name, last_name: last_name, age: age, username: username, password: password)
end

def login_vs_register
    choices = %w(login register)
        answer = @prompt.select("Choose login or register", choices)
    if answer == "login"
        login
    end 
    if answer == "register"
        register    
    end 
    puts "Hi #{@user.first_name}!"
end

def main_menu
    choices = ["Find a flight", "Visit profile"]
        answer = @prompt.select("Main Menu", choices)
        if answer == "Find a flight"
            find_a_flight
        elsif answer == "Visit profile"
            visit_profile
        end
end

def find_a_flight
    puts "Please specify the folowing details:"
        origin = @prompt.ask('Where are you flying from?')
        destination = @prompt.ask('Where do you want to fly to?')
        date = @prompt.ask('When do you want to travel?')
        flights = Flight.find_by_date_origin_destination(origin, destination, date)
        
        flights.each{|f|
        puts " "
        puts "Flight ID #{f.id}"
        puts Airline.find(f.airline_id).name
        puts f.origin
        puts f.destination
        puts f.date_time
        puts "#{f.price}£"
        puts " "
     }
     flights_array = flights.map{|f| f.id}
     answer = @prompt.select("Choose flight by flight ID", flights_array)

     book_flight(answer)

     puts "Your flight to #{Flight.find(answer).destination} has been booked."

     main_menu
end

def book_flight(flight_id)
    @user.add_booking(flight_id)
end

def visit_profile
    choices = ["Bookings", "About"]
        answer = @prompt.select("Profile options", choices)
        if answer == "Bookings"
            puts @user.see_bookings
        elsif answer == "About"
            puts "about"
        end
end

def run
    intro
    login_vs_register
    main_menu
end

end