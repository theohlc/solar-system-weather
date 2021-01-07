class WeatherController
    def initialize
        puts "Hello! Welcome to Solar System Weather!"
        get_weather
    end

    def get_weather
        user_input = String.new
        puts "Please enter the US zip code or city name:"
        user_input = gets

        weather_getter = WeatherGetter.new(user_input)
        puts weather_getter.information
        comp_planet = Planet.new(weather_getter.temp_f)
        if weather_getter.temp_f > 70
            puts "Wow, thats hot!"
        elsif weather_getter.temp_f < 35
            puts "BRRRRRR! Too cold for me!"
        else 
            puts "#{weather_getter.temp_f}, sounds nice."
        end
        puts "It must feel like #{comp_planet.name}!"
    end




end