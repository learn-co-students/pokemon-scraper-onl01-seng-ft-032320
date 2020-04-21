class Pokemon
   attr_accessor :id, :name, :type, :db

   def initialize(id:, name:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
   end

   def self.save(name,type,db)
      sql = "
      INSERT INTO pokemon (name,type)
      VALUES (?,?)
      "
      db.execute(sql,name,type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
   end

   def self.find(p_id,db)
      sql = "
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
      "
      r = db.execute(sql, p_id).flatten
      Pokemon.new(id:r[0],name: r[1],type: r[2], db: db)
   end

end
