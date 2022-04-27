[![codecov.io Code Coverage](https://img.shields.io/codecov/c/github/dwyl/hapi-auth-jwt2.svg?maxAge=2592000)](https://codecov.io/github/dwyl/hapi-auth-jwt2?branch=main) [![Code Climate](https://codeclimate.com/github/dwyl/esta/badges/gpa.svg)](https://codeclimate.com/github/dwyl/esta)

## Welcome to Sweater Weather

#### Sweater Weather is a Rails API application used to return data for road trips. The variety of endpoints will allow users to input params on a front end application to return weather, food, length, and other details realated to the trip.

#### This app will be used in conjunction with a front end framework like React.

## Getting Started

1. Fork and Clone the repo: [GitHub](https://github.com/glsorensen/sweater_weather)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Get OpenWeather API key [here](https://openweathermap.org/)
5. Get MapQuest Geocoding API key [here](https://developer.mapquest.com/documentation/geocoding-api/)
6. Get Pexels API key [here](https://www.pexels.com/api/)
7. Get Yelp API key [here](https://www.yelp.com/developers/documentation/v3)
8. Setup Figaro: `bundle exec figaro install`
9. Add API keys to `config/application.yml`
    ```
    open_weather: put_your_key_here>
    map_quest: put_your_key_here>
    map_quest_secret: put_your_key_here>
    pexel_api:put_your_key_here>
    YELP_API_KEY: put_your_key_here>
    YELP_CLIENT_ID: put_your_key_here>
    ```
## API Info:

Please checkout the full API documentation [here](https://documenter.getpostman.com/view/20017443/UyrEgEFp)

### Consumed:
    - OpenWeather
      - [One Call API 1.0](https://openweathermap.org/api/one-call-api)
        - `https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}`
        - Used for weather forecast data. We are utilizing Current, Hourly, and Daily data.
    - MapQuest
      - [Directions API - Route](https://developer.mapquest.com/documentation/directions-api/route/get)
        - `http://www.mapquestapi.com/directions/v2/route?key=KEY&from=Clarendon Blvd,Arlington,VA&to=2400+S+Glebe+Rd,+Arlington,+VA`
        - Used for getting drive time to determine ETA for destination
      - [Geocoding API - Address](https://developer.mapquest.com/documentation/geocoding-api/address/get)
        - `http://www.mapquestapi.com/geocoding/v1/address?key=KEY&location=Washington,DC`
        - Used for retrieving latitude and longitude coordinates for destination, which is then passed into the OpenWeather API
    - Pexel
      - [Search Photos](https://api.pexels.com/v1/search?)
        - `https://api.unsplash.com/search/photos?page=1&query=cloudy`
    - Yelp Fusion 
      - [Business Search](https://www.yelp.com/developers/documentation/v3/business_search)
        - `https://api.yelp.com/v3/businesses/search?term=tacos&location=denver,co`
        - Used to search for restaurants at destination city that will be open at time of arrival that matches food/restaurant type selected in request


## Built With:

  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />  <img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" />  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/> <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" /> <img src="https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white" /> <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" /> <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />      


## Testing:

  - This application is fully tested through RSpec. 
  - You can run RSpec on any directory/file using `bundle exec rspec <directory/file>`
  - See details here: [SimpleCov](https://github.com/simplecov-ruby/simplecov)

## Contributors

- [Gunnar Sorensen](https://github.com/glsorensen)
