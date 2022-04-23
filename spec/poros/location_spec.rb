require 'rails_helper'

RSpec.describe Location do
  it 'exists' do
    lat = 39.738453
    lng = -104.984853

    coords = Location.new(lat, lng)

    expect(coords).to be_a Location
    expect(coords.latitude).to eq(lat)
    expect(coords.longitude).to eq(lng)
  end
end
