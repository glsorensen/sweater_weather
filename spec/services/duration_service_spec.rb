require 'rails_helper'

RSpec.describe 'Duration Service' do
  it 'returns a faraday response', :vcr do
      connection = DurationService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns duration', :vcr do
    get_duration = DurationService.get_duration("Denver,CO", "Pueblo, CO")
    expect(get_duration).to be_a Hash

  end
end
