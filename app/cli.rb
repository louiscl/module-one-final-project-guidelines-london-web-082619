class Cli


def initialize
    @prompt = TTY::Prompt.new
    @user = nil
end

def intro
    system ('clear')   
    puts "███████╗██╗     ██╗ ██████╗ ██╗  ██╗████████╗    ██████╗  ██████╗  ██████╗ ██╗  ██╗██╗███╗   ██╗ ██████╗      █████╗ ███████╗███████╗██╗███████╗████████╗ █████╗ ███╗   ██╗████████╗".colorize(:light_blue)
    sleep(0.1)
    puts "██╔════╝██║     ██║██╔════╝ ██║  ██║╚══██╔══╝    ██╔══██╗██╔═══██╗██╔═══██╗██║ ██╔╝██║████╗  ██║██╔════╝     ██╔══██╗██╔════╝██╔════╝██║██╔════╝╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝".colorize(:light_blue)
    sleep(0.1)
    puts "█████╗  ██║     ██║██║  ███╗███████║   ██║       ██████╔╝██║   ██║██║   ██║█████╔╝ ██║██╔██╗ ██║██║  ███╗    ███████║███████╗███████╗██║███████╗   ██║   ███████║██╔██╗ ██║   ██║   ".colorize(:light_blue)
    sleep(0.1)
    puts "██╔══╝  ██║     ██║██║   ██║██╔══██║   ██║       ██╔══██╗██║   ██║██║   ██║██╔═██╗ ██║██║╚██╗██║██║   ██║    ██╔══██║╚════██║╚════██║██║╚════██║   ██║   ██╔══██║██║╚██╗██║   ██║   ".colorize(:light_blue)
    sleep(0.1)
    puts "██║     ███████╗██║╚██████╔╝██║  ██║   ██║       ██████╔╝╚██████╔╝╚██████╔╝██║  ██╗██║██║ ╚████║╚██████╔╝    ██║  ██║███████║███████║██║███████║   ██║   ██║  ██║██║ ╚████║   ██║   ".colorize(:light_blue)
    sleep(0.1)
    puts "╚═╝     ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   \n\n".colorize(:light_blue)                                                                                                                                                                         
end




def login
        username = @prompt.ask('Enter username')
        password = @prompt.mask('Enter password')
        if User.verify_login(username, password)
           @user = User.find_user_by_username(username)
           puts "Hi #{@user.first_name}!"
        else
            puts "Username or password incorrect".colorize(:color => :white, :background => :red)
            
        end
end

def register
        first_name = @prompt.ask('What is your first name?')
        last_name = @prompt.ask('What is your last name?')
        age = @prompt.ask('How old are you?')
        username = @prompt.ask('Create a username')
        password = @prompt.mask('Create a password')
        @user = User.create(first_name: first_name, last_name: last_name, age: age, username: username, password: password)
        puts "Hi #{@user.first_name}!"
end

def login_vs_register
    
    puts "\n   -- Login Menu --   \n".colorize(:color => :white, :background => :light_blue) 

    choices = %w(login register leave)
        answer = @prompt.select("Login or register", choices)
    if answer == "login"
        login
    elsif answer == "register"
        register   
    elsif answer == "leave"
        puts "\nThank you for nothing :)\n".colorize(:cyan).bold
        exit
    end 
end

def main_menu

    puts ' '
    puts "   -- Main Menu --   ".colorize(:color => :white, :background => :blue)
    puts ' '

    choices = ["Find a flight", "Skyscanner", "Visit profile", "Logout"]
        answer = @prompt.select("Your options", choices)
        if answer == "Find a flight"
            find_a_flight
        elsif answer == "Visit profile"
            visit_profile
        elsif answer == "Skyscanner"
            skyscanner
        elsif answer == "Logout"
            puts "Thank you very much for trusting our personal flight booking assistant".colorize(:light_blue)
        end
end

def find_a_flight
    puts "\n -- Flight Finder -- \n".colorize(:color => :white, :background => :blue)
    puts "Please specify the folowing details:"
        origin = @prompt.ask('Where are you flying from?')
        destination = @prompt.ask('Where do you want to fly to?')
        date = @prompt.ask('When do you want to travel?')
        flights = Flight.find_by_date_origin_destination(origin, destination, date)
        
    print_flight_infos(flights)

     flights_array = flights.map{|f| f.id}
     answer = @prompt.select("Choose flight by flight number", flights_array)


    #  answer_id = nil
     book_flight(answer)

     puts "Your flight to #{Flight.find(answer).destination} has been booked."

     main_menu
end

def skyscanner

    puts "\n -- Flight Finder -- \n".colorize(:color => :white, :background => :blue)
    puts "Please specify the folowing details:"
        origin = @prompt.ask('Where are you flying from?')
        destination = @prompt.ask('Where do you want to fly to?')
        date = @prompt.ask('When do you want to travel?(YYYY-MM-DD)')
        api = Api.new
        api.find_flight(origin, destination, date)
 end

def print_flight_infos(flight_array)
    flight_array.each{|f|
    puts "\nFlight number #{f.id}"
    puts Airline.find(f.airline_id).name
    puts f.origin
    puts f.destination
    puts f.date_time
    puts "#{f.price}£"
    puts " "
}
end

def print_user_infos
    puts @user.full_name
    puts @user.age
    puts @user.username
    puts "Number of flights booked:"
    puts @user.num_flights_taken
end

def book_flight(flight_id)
    @user.add_booking(flight_id)
end

def visit_profile
    choices = ["Bookings", "About"]
        answer = @prompt.select("Profile options", choices)
        if answer == "Bookings"
            flights = @user.flights
            print_flight_infos(flights)
        elsif answer == "About"
            print "Personal information: "
            print_user_infos
        end
    main_menu
end

def run
    intro
    login_vs_register
    main_menu
end

end