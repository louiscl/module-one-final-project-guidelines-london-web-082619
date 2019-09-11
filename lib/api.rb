require 'unirest'
require 'pry'


    def find_by_place(city)
        response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/autosuggest/v1.0/UK/GBP/en-GB/?query=#{city}",
        headers:{
            "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
            "X-RapidAPI-Key" => "64b9d1e264msh179232e5f81caf8p1c6f1djsn0050406ad8fb",
            "Accept" => "application/json"
        }
        # response.body["Places"][0]["PlaceId"]
    end

    def place_id(city)
        response = find_by_place(city) 
        response.body["Places"][0]["PlaceId"]
    end
    def city_name(city)
        response = find_by_place(city) 
        response.body["Places"][0]["PlaceName"]
    end

    def find_city_by_place_id(response, place_id)
        # response.body["Places"][0]
    end

    def browse_quotes(origin, destination, date)
        response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/UK/GBP/en-US/#{place_id(origin)}/#{place_id(destination)}/#{date}",
        headers:{
            "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
            "X-RapidAPI-Key" => "64b9d1e264msh179232e5f81caf8p1c6f1djsn0050406ad8fb",
            # "Accept" => "application/json" # to get a response as a json 
            "Accept" => "application/json"
            }
           
    end

    def find_flight(origin, destination, date)

            quote = browse_quotes(origin, destination, date)
            quote.body["Quotes"].each_with_index{|q, index| 
                
                # puts "Date: #{q["DepartureDate"]}"
                puts "price: #{q["MinPrice"]}"
                puts "from: #{city_name(origin)}"
                puts "to: #{city_name(destination)}"
                puts "Airline: #{quote.body["Carriers"][index]["Name"]}"
                puts "------------------------"
                
            }
    end

        binding.pry
        0
    
    