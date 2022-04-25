class Munchie
  attr_reader :id,
              :type,
              :destination_city,
              :travel_time,
              :forecast,
              :yelp_results

  def initialize(destination, trip_duration, yelp_results, destination_city, get_weather)

    @id = nil
    @type = 'munchie'
    @destination_city = destination.titleize
    @travel_time = trip_duration[:route][:legs].first[:formattedTime]
    @forecast = {
      summary: get_weather[:current][:weather].first[:description],
      temperature: get_weather[:current][:temp]
    }
    @yelp_results = {
      name: yelp_results[:businesses].first[:name],
      address: yelp_results[:businesses].first[:location][:display_address]
    }
  end
end
