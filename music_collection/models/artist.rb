require_relative("../db/sql_runner")
require_relative("album.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

 def save()
   sql = "INSERT INTO artists
   (name)
   VALUES
   ($1)
   RETURNING *"
   values = [@name]
   returned_array = SqlRunner.run(sql, values)
   artist_hash = returned_array[0]
   id_string = artist_hash["id"]
   @id = id_string.to_i
 end

 def self.all()
   sql = "SELECT * FROM artists"
   artist_hashes = SqlRunner.run(sql)
   artist_objects = artist_hashes.map{|artist| Artist.new(artist)}
   return artist_objects
 end

 def albums()
  sql = "SELECT * FROM albums
  WHERE artist_id = $1"
  values = [@id]
  album_hashes = SqlRunner.run(sql, values)
  album_objects = album_hashes.map { |album_hash| Album.new(album_hash) }
  return album_objects
end

 def self.find(id)
   sql = "SELECT * FROM artists WHERE id = $1"
   values = [id]
   results = SqlRunner.run(sql, values)
   artist_hash = results.first
   artist = Album.new(artist_hash)
   return artist
 end
end
