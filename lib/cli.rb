class WeatherController
    attr_accessor :weather_getter, :comp_planet

    def initialize
        puts "Hello! Welcome to Solar System Weather!"
        get_weather
    end

    def get_weather
        user_input = String.new
        puts "Please enter a US zip code or city name:"
        user_input = gets

        @weather_getter = WeatherGetter.new(user_input)
        puts weather_getter.information
        @comp_planet = Planet.new(weather_getter.temp)
        if weather_getter.temp > 70
            puts "Wow, thats hot!"
        elsif weather_getter.temp < 35
            puts "BRRRRRR! Too cold for me!"
        else 
            puts "#{weather_getter.temp}, sounds nice."
        end
        
        comp_planet.planet_key == :earth ? puts("It must feel like just another day on Earth."): puts("It must feel like #{comp_planet.name}!") 

        comp_planet.planet_facts

        more_information
    end

    def more_information
        input = ""

        while input != 'exit'
            puts "\nTo see more about the temperature, type 'temp'."
            puts "To see more about the atmospheric conditions type 'atm'."
            puts "To see more about precipitation, type 'rain'."
            puts "To try a new location, type 'return'."
            puts "To exit, type 'exit'"
        
            input = gets.chomp.strip
            puts
            
            case input
            when "temp"
                compare_temps
            when 'atm'
                compare_atmosphere
            when 'rain'
                compare_rain
            when 'return'
                get_weather
            when 'exit'
                exit!
            end
            
        end
    end

    def compare_temps
       
        diff = @weather_getter.temp - @comp_planet.temp
        puts "Today's high is #{weather_getter.high}, the low for today is #{weather_getter.low}"
        if diff > 0
            puts "Right now it's #{weather_getter.temp}, #{diff} degrees warmer than the average temperature on #{comp_planet.name}."
        elsif diff < 0
            puts "Right now it's #{weather_getter.temp}, #{-1*diff} degrees colder than the average temperature on #{comp_planet.name}."
        else
            puts "What a coincidence! 61 is the average temperature on earth!"
        end
    end

    def compare_atmosphere
        puts "The atmospheric pressure today is #{weather_getter.pressure} millibars. The humidity is #{weather_getter.humidity} percent."
        if comp_planet.planet_key != :earth && comp_planet.atm == "none"
            puts "On earth the atmosphere is made of mostly nitrogen and oxygen, on #{comp_planet.name} there is no atmosphere!"
        elsif comp_planet.planet_key != :earth
            puts "On earth the atmosphere is made of mostly nitrogen and oxygen, on #{comp_planet.name} the atmosphere is made of mostly #{comp_planet.atm}."
        end
    end

    def compare_rain
        
        if weather_getter.code > 700
            puts "It is not precipitating right now."
        else
            puts "The current precipitation is #{weather_getter.description.downcase}."
        end

        if comp_planet.rain == 'none'
            puts("There is no precipitation on #{comp_planet.name}.")
        elsif comp_planet.rain == 'once' 
            puts "There is no precipitation on mars, but it is possible that it once rained water there."
        else
            puts("On #{comp_planet.name} instead of raining or snowing water, it precipitates #{comp_planet.rain}.")
        end
    end
end