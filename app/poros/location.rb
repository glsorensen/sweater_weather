class Location
  attr_reader :longitude, :lattitude
  def initialize(lat, lng)
    @longitude = lng
    @lattitude = lat
  end
end
