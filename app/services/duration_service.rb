require 'faraday'
require 'json'

class DurationService
  def self.connection
    Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['map_quest']
    end
  end

  def self.get_duration(from, to)
    response = connection.get('/directions/v2/route') do |faraday|
      faraday.params['from'] = from
      faraday.params['to'] = to
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
