require 'pry'

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:, type:, id: nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(pokemon_id, database)
    array = database.execute("SELECT * FROM pokemon WHERE id = ? ", pokemon_id)[0]
    pokemon = Pokemon.new(id:array[0], name:array[1], type:array[2], db: database)
  end
end
