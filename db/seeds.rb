Flight.destory_all
User.destory_all
Trip.destory_all
Airline.destory_all



easyjet = Airline.create(name: "EasyJet", business_model: "low cost", founded: "19950301")
ba = Airline.create(name: "British Airways", business_model: "premium", founded: "19740331")
emirates = Airline.create(name: "Emirates", business_model: "premium", founded: "19850325")


flight_1 = Flight.create(origin: "London", destination: "Dubai", date_time: "20190920 163000", price: 450, airline_id: easyjet.id)
flight_2 = Flight.create(origin: "London", destination: "Paris", date_time: "20190920 120000", price: 200, airline_id: easyjet.id)
flight_3 = Flight.create(origin: "London", destination: "Dusseldorf", date_time: "20190921 153000", price: 300, airline_id: easyjet.id)
flight_4 = Flight.create(origin: "Manchester", destination: "Ibiza", date_time: "20190921 080000", price: 80, airline_id: easyjet.id)
flight_5 = Flight.create(origin: "Manchester", destination: "Paris", date_time: "20190922 100000", price: 200, airline_id: easyjet.id)

flight_6 = Flight.create(origin: "London", destination: "Dubai", date_time: "20190920 100000", price: 600, airline_id: emirates.id)
flight_7 = Flight.create(origin: "London", destination: "Dusseldorf", date_time: "20190921 130000", price: 300, airline_id: emirates.id)
flight_8 = Flight.create(origin: "London", destination: "Paris", date_time: "20190920 230000", price: 250, airline_id: emirates.id)
flight_9 = Flight.create(origin: "London", destination: "Dubai", date_time: "20190922 160000", price: 400, airline_id: emirates.id)

flight_10 = Flight.create(origin: "London", destination: "Dusseldorf", date_time: "20190921 140000", price: 400, airline_id: ba.id)
flight_11 = Flight.create(origin: "Manchester", destination: "Dusseldorf", date_time: "20190921 150000", price: 50, airline_id: ba.id)
flight_12 = Flight.create(origin: "Manchester", destination: "Ibiza", date_time: "20190921 090000", price: 100, airline_id: ba.id)
flight_13 = Flight.create(origin: "Manchester", destination: "Paris", date_time: "20190920 110000", price: 300, airline_id: ba.id)
flight_14 = Flight.create(origin: "London", destination: "Dubai", date_time: "20190920 113000", price: 450, airline_id: ba.id)

user_1 = User.create(first_name: "Max", last_name: "Braun", age: 23, username: "maxbraun", password: "max")
user_2 = User.create(first_name: "Abdullah", last_name: "Bajaman", age: 35, username: "abdullahbajaman", password: "abdullah")
user_3 = User.create(first_name: "Louis", last_name: "Lammerting", age: 23, username: "louislammerting", password: "louis")

trip_1 = Trip.create(flight_id: flight_1.id, user_id: user_1.id)
trip_2 = Trip.create(flight_id: flight_7.id, user_id: user_2.id)
trip_3 = Trip.create(flight_id: flight_12.id, user_id: user_3.id)