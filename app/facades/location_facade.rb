class LocationFacade
  def self.find_coords(location)
    json = LocationService.get_coordinates(location)
    Location.new(json[:lat], json[:lng])
  end
end
