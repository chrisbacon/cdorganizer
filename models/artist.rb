require_relative('../db/sql_runner')

class Artist
    attr_accessor :name
    attr_reader :id

    def initialize( options )
        @name = options['name']
        @id = options['id'].to_i if options['id']
    end
    
    def save()
        sql = "
        INSERT INTO artists
        (name)
        VALUES
        ('#{@name}')
        returning *
        ;"

        result = SqlRunner.run(sql)
        @id = result[0]['id'].to_i
    end

    def update()
        sql = "
        UPDATE artists
        SET (name) = ('#{@name}') WHERE id = #{@id};
        "
        SqlRunner.run(sql)
    end

    def albums()
        sql = "
        SELECT * FROM albums
        WHERE artist_id = #{@id}
        ;"

        result = SqlRunner.run(sql)
        return result.map { |hash| Album.new(hash) }
    end

    def delete()
        sql = "
        DELETE FROM artists
        WHERE id = #{@id}
        ;"
        SqlRunner.run(sql)
    end
    
    def self.all()
        sql = "
        SELECT * FROM artists;
        "
        result = SqlRunner.run(sql)
        return result.map{ |hash| Artist.new(hash) }
    end

    def self.delete_all()
        sql = "
        DELETE FROM artists;
        "
        SqlRunner.run(sql)
    end


end