require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @artist_id = options["artist_id"].to_i
    @title = options["title"]
    @genre = options["genre"]

  end

  def save()
    sql = "INSERT INTO albums
    (artist_id,
     title,
     genre)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@artist_id, @title, @genre]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i

  end

end
