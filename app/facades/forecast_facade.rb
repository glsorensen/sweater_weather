# frozen_string_literal: true

class ForecastFacade
  def self.find_forecast(lat, lon)
    json = ForecastService.get_forecast(lat, lon)
  end
end
