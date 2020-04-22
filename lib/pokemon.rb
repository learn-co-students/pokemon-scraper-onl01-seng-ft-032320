require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        name = result[1]
        type = result[2]
        # binding.pry
        pokemon_inst = Pokemon.new(id: id, name: name, type: type, db: db)
    end

end
