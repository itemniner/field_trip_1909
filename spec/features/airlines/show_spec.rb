require 'rails_helper'

RSpec.describe "Airline Show Spec" do
  describe "When I visit the airline show page" do
    it 'I can see that airlines name, all its flights and all the unique list of passenger for thsoe flights' do
      southwest = Airline.create(name: "Southwest")

      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      southwest_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")


      passenger_1 = Passenger.create(name: "Lucy", age:26)
      passenger_2 = Passenger.create(name: "Jimmy", age:36)
      passenger_3 = Passenger.create(name: "Tony", age:2)
      passenger_4 = Passenger.create(name: "Hannah", age:18)
      passenger_5 = Passenger.create(name: "David", age:20)


      PassengerFlight.create(passenger: passenger_1, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_2, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_3, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_4, flight: southwest_2)
      PassengerFlight.create(passenger: passenger_5, flight: southwest_2)

      visit "/airlines/#{southwest.id}"

      expect(page).to have_content(southwest.name)

      within "#flight-#{southwest_1.id}" do
        expect(page).to have_content("Flight Number: #{southwest_1.number}")
        expect(page).to have_content("Date: #{southwest_1.date}")
        expect(page).to have_content("Time: #{southwest_1.time}")
        expect(page).to have_content("Departure City: #{southwest_1.departure_city}")
        expect(page).to have_content("Arrival City: #{southwest_1.arrival_city}")
        expect(page).to have_content(passenger_1.name)
        expect(page).to have_content(passenger_2.name)
        expect(page).to have_content(passenger_3.name)
      end

      within "#flight-#{southwest_2.id}" do
        expect(page).to have_content("Flight Number: #{southwest_2.number}")
        expect(page).to have_content("Date: #{southwest_2.date}")
        expect(page).to have_content("Time: #{southwest_2.time}")
        expect(page).to have_content("Departure City: #{southwest_2.departure_city}")
        expect(page).to have_content("Arrival City: #{southwest_2.arrival_city}")
        expect(page).to have_content(passenger_4.name)
        expect(page).to have_content(passenger_5.name)
      end
    end
  end
end
