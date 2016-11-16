require_relative('../db/sql_runner')

class Album
    def initialize(options)
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id']
        @id = options['id'].to_i if options['id']
    end
    
    def save()
        sql = "
        INSERT INTO albums
        (title, genre, artist_id)
        VALUES
        ('#{@title}', '#{@genre}', #{@artist_id})
        returning *
        ;"
        result = SqlRunner.run(sql)
        @id = result[0]['id'].to_i
    end

    def artist
        sql = "
        SELECT * FROM artists
        WHERE id = #{@artist_id}
        ;"

        result = SqlRunner.run(sql)
        return Artist.new(result[0])
    end

    def self.all
        sql = "
        SELECT * FROM albums;
        "
        result = SqlRunner.run(sql)
        return result.map{ |hash| Album.new(hash) }
    end

    def self.delete_all
        sql = "
        DELETE FROM albums;
        "
        SqlRunner.run(sql)
    end
    
end