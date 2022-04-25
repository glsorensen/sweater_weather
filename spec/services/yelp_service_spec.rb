require 'rails_helper'

RSpec.describe YelpService do
  it "gets restaurants for a given location" do
    service = YelpService.get_restaurants('pueblo,co', 'chinese')
    binding.pry
    expect(service.class).to eq(Hash)
    expect(service.count).to eq(1)
  end
end
