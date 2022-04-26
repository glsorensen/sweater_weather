require 'rails_helper'
RSpec.describe FoodFacade do
 it ".find_coords", :vcr do
   result = FoodFacade.destination("pueblo", "chinese")
   expect(result).to be_a(Hash)
  end
end
