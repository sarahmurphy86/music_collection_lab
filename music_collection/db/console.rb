require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({
  'name' => 'Abba'
  })
artist1.save()

artist2 = Artist.new({
  'name' => 'Dolly Parton'
  })
artist2.save()


album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Gold',
  'genre' => 'Pop'
  })
album1.save()

album2 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Dolly Parton Hits',
  'genre' => 'Country'
  })
album2.save()

binding.pry
nil
