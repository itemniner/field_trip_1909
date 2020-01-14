class PassengersController < ApplicationController  
  # def destroy
  #   # binding.pry
  #   passenger = Passenger.find(params[:id])
  #   # PassengerFlight.destroy(:passengers)
  #   passenger.destroy
  #   # flash[:success] = "Passenger Deleted"
  #   redirect_to "/flights"
  # end

  #   def remove_passenger_from_flight
  #    passenger = Passenger.find(params[:id])
  #    flight = passenger.flights.find(params[:id])

  #    if flight
  #       passenger.flights.delete(flight)
  #    end

  # end
def remove_passenger_from_flight
    passenger = Passenger.find(params[:id])
    passenger_flight = PassengerFlight.where(passenger_id: passenger.id).destroy_all
    passenger.destroy
    redirect_to "/flights"
end

# def remove_passenger_from_flight
#     self.destroy_all
#     redirect_to "/flights"
# end
end