require 'pry'

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  
  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS db(id INTEGER PRIMARY KEY, name TEXT, type TEXT);"
    db.execute(sql)
  end
  
  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end
  
  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    id = results[0][0]
    name = results[0][1]
    type = results[0][2]
    db = results[0][3]
    
    pokemon = self.new(id: id, name: name, type: type, db: db)
  end
  
end
