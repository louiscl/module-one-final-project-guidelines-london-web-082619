user_1 = User.create(first_name: "Abdullah",last_name: "Saudi",age: 35 )
user_2 = User.create(first_name: "Max",last_name: "Braun", age: 23)
user_3 = User.create(first_name: "Sophie",last_name: "Milanova", age: 24)
user_4 = User.create(first_name: "Lara",last_name: "Libya" ,age: 21)
user_5 = User.create(first_name: "Sarah",last_name: "Brazil" ,age: 28)

easyjet = Airline.create(name: "Easy Jet", business_model: "Low-cost", founded: 1995)
british_airways = Airline.create(name: "British Ariways", business_model: "Premium", founded: 1974)
emirates = Airline.create(name: "Emirates", business_model: "Premium", founded: 1985)



trip1 = Trip.create(origin: "London", destination: "Paris", departure_date_time: "20190920 140000", arrival_date_time: "20190920 160000", price: 100.0, user_id: user_1.id, airline_id: easyjet.id)
trip2 = Trip.create(origin: "Brussels", destination: "Antwerp", departure_date_time: "20191002 150000", arrival_date_time: "20191002 170000", price: 80.0, user_id: user_2.id, airline_id: british_airways.id)
trip3 = Trip.create(origin: "Toronto", destination: "Montreal", departure_date_time: "20191101 080000", arrival_date_time: "20191101 100000", price: 150.0, user_id: user_3.id, airline_id: emirates.id)
trip4 = Trip.create(origin: "Beijing", destination: "Paris", departure_date_time: "20191212 140000", arrival_date_time: "20191213 010000", price: 10500.0, user_id: user_1.id, airline_id: easyjet.id)