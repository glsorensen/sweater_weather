# frozen_string_literal: true

class FoodFacade
  def self.destination(location, type)
    json = YelpService.get_restaurants(location, type)
  end
end
