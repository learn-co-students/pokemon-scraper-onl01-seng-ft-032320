class Pokemon

    attr_accessor :name, :type, :db, :id, :hp

    def initialize(keywords)

    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon = db.execute(sql, num)
        new_pokemon = self.new(pokemon)
        new_pokemon.id = pokemon[0][0]
        new_pokemon.name = pokemon[0][1]
        new_pokemon.type = pokemon[0][2]
        new_pokemon.hp = pokemon[0][3]
        new_pokemon
    end
end
