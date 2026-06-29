class BookingsController < ApplicationController
  def new
    @flight   = Flight.find(params[:flight_id])
    @passenger_count = params[:passengers].to_i.clamp(1, 4)
    @booking  = @flight.bookings.build
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking confirmed! Confirmation emails have been sent."
    else
      @passenger_count = @booking.passengers.size.clamp(1, 4)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: %i[id name email])
  end
end