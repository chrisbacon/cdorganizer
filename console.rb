require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

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

album1.title = 'Purple shame'

album1.update()


pry.binding
nil