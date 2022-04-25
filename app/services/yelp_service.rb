class YelpService
#   def get_res

def conn
    Faraday.new("https://api.yelp.com") do |faraday|
      faraday.request :authorization, 'Bearer', ENV['YELP_API_KEY']
    end
  end


  def get_restaurants(location, type, open_at)
    response = conn.get("/v3/businesses/search") do |r|
      r.params['location'] = location
      r.params['limit'] = 3
      r.params['term'] = type
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
