class PassengersController < ApplicationController  

  # def remove_passenger_from_flight
  #   passenger = Passenger.find(params[:id])
  #   # # PassengerFlight.where(flight_id: )
  #   # # # assengerFlight.where(passenger_id: passenger.id).destroy_all
  #   # # # binding.pry
  #   # # passenger.delete
    
  #   PassengerFlight.delete.Passenger.find(params[:id]).where(passenger_id: passenger.id)
  #   # Passenger.delete(params[:id]).where(passenger_id: passenger.id)
  #   redirect_to "/flights"
  # end

  def remove_passenger_from_flight
    passenger = Passenger.find(params[:id])

    pass = PassengerFlight.where(passenger_id: passenger.id)
    pa = pass.
    if passenger.
    binding.pry
    pass.delete
  end


end