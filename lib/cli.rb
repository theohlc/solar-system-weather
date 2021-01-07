class WeatherController
    def initialize
        
    end

    def call
        user_input = String.new
        puts "Hello! Welcome to Solar System Weather!"
        puts "To see the weather for a location please type 'weather'. \n
        This will also display facts about a planet in our solar system."
        puts "To exit, type 'exit'"

        until user_input == 'exit'
            user_input = gets
            if user_input == 'weather'
                get_weather
                break
            end
        end
    end

    def get_weather
        user_input = String.new
        puts "Please enter the US zip code or city name:"
        user_input = gets

        @weather_getter = WeatherGetter.new(user_input)
    end

    def 


end