# frozen_string_literal: true

require './app/poros/road_trip'
class DurationFacade
  def self.duration(origin, destination)
    info = DurationService.get_duration(origin, destination)
    if info[:route][:routeError][:errorCode] == 2
      nil
    else
      RoadTrip.new(info)
    end
  end
end
