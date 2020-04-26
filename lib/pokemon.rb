class Pokemon
    attr_accessor :name, :type, :db 
    attr_reader :id

    def initialize(name:, type:, id:, db:)
        @name = name
        @type = type
        @db = db 
        @id = id
    end 

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
            WHERE pokemon.id = ?
        SQL

        result = db.execute(sql, id)[0]
        new_pokemon = self.new(id: result[0], name: result[1], type: result[2], db: db)
    end 
end
