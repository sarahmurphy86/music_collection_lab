require('pry')
require_relative('../models/album')
require_relative('../models/artist')

album1 = Album.new({
  'title' => 'Gold',
  'genre' => 'Pop'
  })

album2 = Album.new({
  'title' => 'Dolly Parton Hits',
  'genre' => 'Country'
  })

artist1 = Artist.new({
  'name' => 'Abba'
  })

artist2 = Artist.new({
  'name' => 'Dolly Parton'
  })

binding.pry
nil
