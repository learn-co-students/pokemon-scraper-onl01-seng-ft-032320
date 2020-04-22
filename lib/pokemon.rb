class Pokemon

    #### Attributes ####
    attr_accessor :id, :name, :type, :db


    #### Instance Methods ####
    def initialize(pokemon_hash)
        pokemon_hash.each do |key, value|
            self.send(("#{key}="), value)
        end
    end

    #### Class Methods####
    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
            SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
            SQL

        row = db.execute(sql, id)
        Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2])
    end
end
