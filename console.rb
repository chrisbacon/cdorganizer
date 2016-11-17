require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')
require_relative('models/song')

artist1 = Artist.new({
    'name' => 'Prince'
    })

artist1.save()

artist1.name = 'The artist formerly known as Prince'

artist1.update()



album1 = Album.new({
    'title' => 'Purple Rain',
    'genre' => 'Rock',
    'artist_id' => artist1.id
    })

album1.save()

album1.title = 'Purple Rain: The Movie OST'

album1.update()

song1 = Song.new({
	'title' => 'Computer Blue',
	'album_id' => album1.id
	})

song1.save()

pry.binding
nil