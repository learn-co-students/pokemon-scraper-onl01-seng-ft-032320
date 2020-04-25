class Pokemon
 attr_accessor :name, :type, :db, :id


 def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
 end

 def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
 end

 def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id=?" , id)
    name = result[0][1]
    type = result[0][2]
    db = result[0][3]
    new_pokemon = self.new(id: id, name: name, type: type, db: db)
 end
end