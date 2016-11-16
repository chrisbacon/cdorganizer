require_relative('../db/sql_runner')

class Song
    attr_accessor :title
    attr_reader :id

    def initialize( options )
        @title = options['title']
        @id = options['id'].to_i if options['id']
        @album_id = options['album_id'].to_i 
    end
    
    def save()
        sql = "
        INSERT INTO songs
        (title)
        VALUES
        ('#{@title}')
        returning *
        ;"

        result = SqlRunner.run(sql)
        @id = result[0]['id'].to_i
    end

    def update()
        sql = "
        UPDATE songs
        SET (title) = ('#{@title}') WHERE id = #{@id};
        "
        SqlRunner.run(sql)
    end



    def delete()
        sql = "
        DELETE FROM songs
        WHERE id = #{@id}
        ;"
        SqlRunner.run(sql)
    end
    
    def self.all()
        sql = "
        SELECT * FROM songs;
        "
        result = SqlRunner.run(sql)
        return result.map{ |hash| Song.new(hash) }
    end

    def self.find_song(id)
        sql = "
        SELECT * FROM songs
        WHERE id = #{id}
        ;"

        result = SqlRunner.run(sql)
        return Song.new(result[0])
    end

    def self.delete_all()
        sql = "
        DELETE FROM songs;
        "
        SqlRunner.run(sql)
    end


end