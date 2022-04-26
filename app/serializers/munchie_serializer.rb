class MunchieSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type 'munchie'

  attributes :destination_city, :travel_time, :forecast, :yelp_results
end
