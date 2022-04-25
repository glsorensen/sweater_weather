class Api::V1::MunchiesController < ApplicationController
  def index
    origin = params[:from]
    destination = params[:to]
    trip_duration = DurationFacade.duration(origin, destination)

    food = params[:food]

    yelp_results = FoodFacade.destination(destination, food)
    destination_city = params[:to].titleize

    get_cordinates = LocationFacade.find_cords(destination)
    get_weather = ForecastFacade.find_forecast(get_cordinates)



    render json: MunchiesSerializer.new(trip_duration, yelp_results, destination_city, get_weather), status: :ok
  end
end
