class RoadtripWeather
  attr_reader :temperature, :conditions

  def initialize(data, time)
    @hours = time / 3600
    @temperature = data[:hourly][@hours][:temp]
    @conditions = data[:hourly][@hours][:weather].first[:description]
  end
end
