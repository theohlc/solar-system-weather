class Planet
    attr_accessor :planet_key

    PLANETS = { #hash of planet facts
        :mercury => {
            :name => "Mercury",
            :temp => 800,
            :rain => "none",
            :atm => "none",
            :fact => "Mercury is the smallest planet in our solar system."
        },
        :venus => {
            :name => "Venus",
            :temp => 880,
            :rain => "sulfuric acid",
            :atm => "carbon dioxide",
            :fact => "A day on venus is longer than a year on venus."
        },
        :earth => {
            :name => "Earth",
            :temp => 61,
            :rain => "water",
            :atm => "air",
            :fact => "Earth is the only planet in the universe known to support life."
        },
        :mars => {
            :name => "Mars",
            :temp => -20,
            :rain => "once",
            :atm => "carbon dioxide",
            :fact => "Mars is home to the tallest mountain in the solar system, Olympus Mons. It stands at an impressive 69,841 feet tall."
        },
        :jupiter => {
            :name => "Jupiter",
            :temp => -162,
            :rain => "diamonds",
            :atm => "hydrogen",
            :fact => "Jupiter is the fastest spinning planet in the solar system."
        },
        :saturn => {
            :name => "Saturn",
            :temp => -218,
            :rain => "diamonds",
            :atm => "hydrogen",
            :fact => "Saturn has 150 moons and moonlets."
        },
        :uranus => {
            :name => "Uranus",
            :temp => -320,
            :rain => "diamonds",
            :atm => "hydrogen",
            :fact => "Uranus was the first planet found using a telescope."
        },
        :neptune => {
            :name => "Neptune",
            :temp => -331,
            :rain => "diamonds",
            :atm => "methane",
            :fact => "Neptune is the furthest planet from the sun."
        },
        :pluto => {
            :name => "Pluto",
            :temp => -388,
            :rain => "none",
            :atm => "nitrogen",
            :fact => "Pluto is a dwarf planet, and not a planet."
        }
    }

    def initialize(local_temp) #initialize planet and assign planet with our earth temp
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

    def name
        PLANETS[planet_key][:name]
    end

    def temp
        PLANETS[planet_key][:temp]
    end

    def rain
        PLANETS[planet_key][:rain]
    end

    def atm
        PLANETS[planet_key][:atm]
    end

    def fact
        PLANETS[planet_key][:fact]
    end

    def planet_facts
        puts fact
    end

end

