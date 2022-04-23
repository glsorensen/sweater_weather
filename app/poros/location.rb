class Location
  attr_reader :longitude, :latitude
  def initialize(lat, lng)
    @longitude = lng
    @latitude = lat
  end
end
