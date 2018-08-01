require 'pry'
require_relative '../models/albums.rb'
require_relative '../models/artists.rb'


# Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Nirvana"
  })
artist1.save()

artist2 = Artist.new({
  "name" => "David Bowie"
  })

  artist2.save()


album1 = Album.new({
  "title" => "Nevermind",
  "genre" => "grunge",
  "artist_id" => artist1.id
  })

album1.save()

album2 = Album.new({
  "title" => "In Utero",
  "genre" => "grunge",
  "artist_id" => artist1.id
  })

album2.save()

album3 = Album.new({
  "title" => "Hunky Dory",
  "genre" => "glam rock",
  "artist_id" => artist2.id
  })

album3.save()


binding.pry
nil
