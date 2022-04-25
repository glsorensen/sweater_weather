class Api::V1::MunchiesController < ApplicationController
  def index
    origin = params[:start]
    destination = params[:end]
    trip_duration = .get_duration(origin, destination)

    food = params[:food]

    yelp_results = YelpBusinessSearchService.new.get_restaurants(destination, food_type)
    display_city = params[:end].strip.split(',')[0].titleize

    render json: MunchiesSerializer.new(yelp_results, display_city).munchies_index, status: :ok
  end
end
