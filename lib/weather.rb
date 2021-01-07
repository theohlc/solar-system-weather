require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class WeatherGetter
    attr_accessor :location, :temp, :conditions, :name
    #URL = "api.openweathermap.org/data/2.5/weather?q="
    def initialize(location)
        @location = location
    end

    def get_weather
        uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=ee933237d6d830cdedcda24207aa4a3d")
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def get_information
    # we use the JSON library to parse the API response into nicely formatted JSON
        info = JSON.parse(self.get_weather)
        #binding.pry
        @conditions= info["weather"][0]["main"] #gets conditions as string
        @temp= info["main"]["temp"]  #gets temp in kelvin as float
        @name= info["name"] #gets name of city
    end

    def information
        temp_f = (temp - 273) * 9 / 5 + 32
        temp_f = temp_f.truncate
        "In #{name}, it is #{temp_f} degrees fahrenheit. The prevailing condition is #{conditions.downcase}"
    end

end

weather = WeatherGetter.new("55106")
weather.get_information
#binding.pry
p weather.information
