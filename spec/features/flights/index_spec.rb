require 'rails_helper'

RSpec.describe "As a vistior" do
  describe "When I visit the index page" do 
    it "can list all flight numbers and see all passenger on that flight" do 
      southwest = Airline.create(name: "Southwest")

      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      southwest_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

      passenger_1 = Passenger.create(name: "Lucy", age:26)
      passenger_2 = Passenger.create(name: "Jimmy", age:36)

      PassengerFlight.create(passenger: passenger_1, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_2, flight: southwest_1)
      
      visit "/flights"

      expect(page).to have_content(southwest_1.number)
      expect(page).to have_content(southwest_2.number)
      
      within "#flight-#{southwest_1.id}" do
        expect(page).to have_content(southwest_1.number)
        expect(page).to have_content(passenger_1.name)
        expect(page).to have_content(passenger_2.name)
      end

      within "#flight-#{southwest_2.id}" do
        expect(page).to_not have_content(southwest_1.number)
        expect(page).to_not have_content(passenger_1.name)
        expect(page).to_not have_content(passenger_2.name)
      end
    end
    it "can remove a passenger from a flight" do 
      southwest = Airline.create(name: "Southwest")

      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      southwest_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

      passenger_1 = Passenger.create(name: "Lucy", age:26)
      passenger_2 = Passenger.create(name: "Jimmy", age:36)
      passenger_3 = Passenger.create(name: "Tony", age:16)
      passenger_4 = Passenger.create(name: "Hannah", age:20)

      PassengerFlight.create(passenger: passenger_1, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_2, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_3, flight: southwest_2)
      PassengerFlight.create(passenger: passenger_3, flight: southwest_1)
      PassengerFlight.create(passenger: passenger_4, flight: southwest_2)
      
      visit "/flights"

      within "#flight-#{southwest_2.id}" do
        expect(page).to have_content(southwest_2.number)
          within "#passenger-#{passenger_3.id}" do
            expect(page).to have_content(passenger_3.name)
            expect(page).to have_link("Remove Passenger")

            click_on "Remove Passenger"
          end
      end

      expect(current_path).to eq("/flights")
      expect(page).to_not have_content(passenger_3.name)
      expect(page).to have_content(passenger_4.name)
      expect(page).to have_content(passenger_1.name)
      
      within "#flight-#{southwest_1.id}" do
         expect(page).to have_content(passenger_3.name)
      end
    end 
  end
end 