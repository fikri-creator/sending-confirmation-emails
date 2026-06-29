class FlightsController < ApplicationController
  def index
    @airports = Flight.distinct.pluck(:from_airport, :to_airport).flatten.uniq.sort
    @passenger_options = (1..4).to_a

    if params[:flight].present? && params[:commit].present?
      @search = search_params
      @flights = Flight.matching(@search[:from_airport],
                                 @search[:to_airport],
                                 @search[:passengers])
    end
  end

  private

  def search_params
    params.require(:flight).permit(:from_airport, :to_airport, :passengers, :departure)
  end
end