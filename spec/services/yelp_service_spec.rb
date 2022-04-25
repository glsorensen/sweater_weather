require 'rails_helper'

RSpec.describe YelpService do
  it "gets restaurants for a given location" do
    service = YelpService.new
    restaurants = service.get_restaurants('pueblo,co', 'chinese')
    expect(restaurants.class).to eq(Hash)
    expect(restaurants.count).to eq(3)
  end
end
