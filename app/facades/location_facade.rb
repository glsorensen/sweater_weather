# frozen_string_literal: true

class LocationFacade
  def self.find_coords(location)
    json = LocationService.get_coordinates(location)
  end
end
