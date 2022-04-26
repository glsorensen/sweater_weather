# frozen_string_literal: true

require 'rails_helper'
RSpec.describe DurationFacade do
  it '.find_coords', :vcr do
    result = DurationFacade.duration('denver', 'pueblo')
    expect(result).to be_a(Hash)
  end
end
