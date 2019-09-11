require 'unirest'
require 'pry'


    #     response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/UK/GBP/en-UK/NOTT/LHR/2019-09-10?inboundpartialdate=2019-12-01",
    #   headers:{
    #     "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
    #     "X-RapidAPI-Key" => "64b9d1e264msh179232e5f81caf8p1c6f1djsn0050406ad8fb",
    #       }

    def browse_quotes
        response = Unirest.get "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/UK/GBP/en-US/#{}LOND-sky/PARI-sky/2019-09-20",
        headers:{
            "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
            "X-RapidAPI-Key" => "64b9d1e264msh179232e5f81caf8p1c6f1djsn0050406ad8fb",
            # "Accept" => "application/json" # to get a response as a json 
            "Accept" => "application/json"
            }
    end
        # qoutes = browse_quotes
        # price = response.body["Quotes"][0]["MinPrice"]
        binding.pry
        0
    
    