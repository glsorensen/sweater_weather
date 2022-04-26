# frozen_string_literal: true

require './app/poros/roadtrip_weather'
class RoadTrip
  attr_reader :start_city, :end_city, :temperature, :conditions, :id, :travel_time

  def initialize(data)
    @id = nil
    @travel_time = data[:route][:legs].first[:formattedTime]
    @end_lat = data[:route][:locations].second[:latLng][:lat]
    @end_lng = data[:route][:locations].second[:latLng][:lng]
    @start_city = data[:route][:locations].first[:adminArea5]
    @end_city = data[:route][:locations].second[:adminArea5]
    weather_at_eta = calculate_weather_at_eta(@end_lat, @end_lng, data[:route][:time])
    @temperature = weather_at_eta.temperature
    @conditions = weather_at_eta.conditions
  end

  def calculate_weather_at_eta(lat, lon, seconds)
    RoadtripWeather.new(ForecastFacade.find_forecast(lat, lon), seconds)
  end
end
