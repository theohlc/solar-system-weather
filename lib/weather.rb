require 'pry'

class WeatherGetter
    attr_accessor :location, :temp, :conditions, :name, :high, :low, :pressure, :humidity, :description, :code
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
        @description= info["weather"][0]["description"]
        @code= info["weather"][0]["id"]
        @temp= to_f(info["main"]["temp"].truncate)  #gets temp in kelvin as int
        @high= to_f(info["main"]["temp_max"].truncate)
        @low= to_f(info["main"]["temp_min"].truncate)
        @pressure= info["main"]["pressure"]
        @humidity= info["main"]["humidity"] 
        @name= info["name"] #gets name of city
    end

    def information
        get_information
        disp_temp = temp
        "In #{name}, it is #{disp_temp} degrees fahrenheit. The prevailing condition is #{conditions.downcase}."
    end

    def to_f(kelvin)
        (kelvin - 273) * 9 / 5 + 32
    end

end