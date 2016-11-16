require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

artist1 = Artist.new({
    'name' => 'Prince'
    })

artist1.save()

album1 = Album.new({
    'title' => 'Purple Rain',
    'genre' => 'Rock',
    'artist_id' => artist1.id
    })

album1.save()




pry.binding
nil