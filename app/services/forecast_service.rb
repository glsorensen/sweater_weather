class ForecastService
  def self.connection
    url = "https://api.openweathermap.org/data/2.5/onecall?"
    Faraday.new(url: url) do |faraday|
      faraday.params['appid'] = ENV['open_weather']
    end
  end

  def self.get_forecast(lat, lon)
    response = connection.get do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = lon
      faraday.params['units'] = "imperial"
      faraday.params['exclude'] = 'minutely'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end