# frozen_string_literal: true

module Api
  module V1
    class MunchiesController < ApplicationController
      def index
        origin = params[:start]
        destination = params[:destination]
        trip_duration = DurationFacade.duration(origin, destination)

        food = params[:food]

        yelp_results = FoodFacade.destination(destination, food)
        destination_city = params[:destination].titleize

        get_cordinates = LocationFacade.find_coords(destination)
        get_weather = ForecastFacade.find_forecast(get_cordinates[:lat], get_cordinates[:lng])

        munchies = Munchie.new(destination, trip_duration, yelp_results, destination_city, get_weather)

        render(json: MunchieSerializer.new(munchies))
      end
    end
  end
end
