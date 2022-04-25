class MunchiesSerializer

  def self.return(forecast,)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": "Pueblo, CO",
          "travel_time": "1 hours 48 min",
          "forecast": {
            "summary": forecast[:current][:weather][0][:description],
            "temperature": forecast[:current][:temp]
          },
          "restaurant": {
            "name": "Chinese Restaurant",
            "address": "4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008"
          }
        }
      }
    }

end
