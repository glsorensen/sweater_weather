class MunchiesSerializer

  def self.return(trip_duration, yelp_results, destination_city, get_weather)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": destination_city,
          "travel_time": trip_duration,
          "forecast": {
            "summary": get_weather[:current][:weather][0][:description],
            "temperature": get_weather[:current][:temp]
          },
          "restaurant": {
            "name": yelp_results[:name],
            "address": yelp_results[:address]
          }
        }
      }
    }

end
