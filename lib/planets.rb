require 'pry'

class Planet
    attr_accessor :temp, :planet_key

    PLANETS = {
        :mercury => {
            :name => "Mercury",
            :temp => 800,
            :rain => "none",
            :atm => "",
            :fact => ""
        },
        :venus => {
            :name => "Venus",
            :temp => 880,
            :rain => "sulfuric acid",
            :atm => "",
            :fact => ""
        },
        :earth => {
            :name => "Earth",
            :temp => 61,
            :rain => "water",
            :atm => "",
            :fact => ""
        },
        :mars => {
            :name => "Mars",
            :temp => -20,
            :rain => "once",
            :atm => "",
            :fact => ""
        },
        :jupiter => {
            :name => "Jupiter",
            :temp => -162,
            :rain => "diamonds",
            :atm => "",
            :fact => ""
        },
        :saturn => {
            :name => "Saturn",
            :temp => -218,
            :rain => "diamonds",
            :atm => "",
            :fact => ""
        },
        :uranus => {
            :name => "Uranus",
            :temp => -320,
            :rain => "diamonds",
            :atm => "",
            :fact => ""
        },
        :neptune => {
            :name => "Neptune",
            :temp => -331,
            :rain => "diamonds",
            :atm => "",
            :fact => ""
        },
        :pluto => {
            :name => "Pluto",
            :temp => -388,
            :rain => "none",
            :atm => "",
            :fact => ""
        }
    }

    def initialize
        
    end

    def planet_set(local_temp)
        case local_temp
        when 90..200
            @planet_key= :venus
        when 80..89
            @planet_key= :mercury
        when 50..79
            @planet_key= :earth
        when 25..49
            @planet_key= :mars   
        when 10..24
            @planet_key= :jupiter 
        when 0..9
            @planet_key= :saturn 
        when -5..-1
            @planet_key= :uranus    
        when -10..-6
            @planet_key= :neptune   
        when -110..-11
            @planet_key= :pluto
        end
    end

    def avg_temp
        PLANETS[planet_key][:temp]
    end

    def rain
        PLANETS[planet_key][:temp]
    end

    def atm_desc

    end
end

planet = Planet.new
planet.planet_set(80)
puts planet.avg_temp