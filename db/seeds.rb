artists = [

  ["The Cure", "http://www.visitprague.cz/en/culture/concerts-opera-ballet/icms_imagePreview.php?boxinto=d0d0d07f&filename=_data%2Ffiles%2F.%2F%2F%2Fa8574e45973b999a6b2f3dd9c7615f57%2Fthe+cure+3.jpg&maxheight=200&maxwidth=300"],

  ["Kings of Leon", "http://nme.assets.ipccdn.co.uk/images/article_x4/2013KingsofLeonPress200313.jpg" ],

  ["The Prodigy", "http://theprodigy.info/pictures/fullsize/logos/the_prodigy_logo_55.jpg"],

  ["Charlie Chan", "https://i.scdn.co/image/0c662745633efd24536d76409f83789670bf9707"],

  ["Avicii", "https://i1.sndcdn.com/artworks-000127464743-bisiov-t500x500.jpg"],

  ["Marvin Gaye", "http://www.okayplayer.com/wp-content/uploads/2013/09/Marvine-Gaye-1981.jpg"],

  ["Don Omar", "http://img.cdandlp.com/2012/10/imgL/115593783.jpg"],

]

artists.each do | name, avatar |
   Artist.create( name: name, avatar: avatar )
end


genres = [
   "Dance",
   "Moombhaton",
   "Club",
   "Soul",
   "Reggeaton",
   "Rock",
]

genres.each do |genre_name|
   genre = Genre.create( name: genre_name )
end

artist_songs = {}

artist_songs["The Cure"] = [

[ "A night like this", "http://www.on-fiction.com/images_cure/Head_door/Anightlikethis_proUS.jpg", "Say goodbye on a night like this
If it's the last thing we ever do
You never looked as lost as this", "Rock"],
]

artist_songs["Kings of leon"] = [

[ "Notion",    "http://eil.com/images/main/Kings+Of+Leon+Notion+492690.jpg", "I got a notion to say what doesn't feel right
Got an answer in your story today
It gave me a sign that didn't feel right, no", "Rock"],
]

artist_songs["The Prodigy"] = [

[ "Smack my bitch up", "http://s0.hulkshare.com/song_images/original/2/6/b/26bb091cccd5d00bbc44f34eef0a2486.jpg?dd=1388552400", "Change my pitch up
Smack my bitch up", "Dance"],
]

artist_songs["Charlie Chan"] = [

[ "Got 2 luv U", "http://cdn-images.deezer.com/images/cover/76f24e9cfc8a60f1490964d53b50214e/120x120-000000-80-0-0.jpg", "Got to love you!
Got to love you!", "Moombhaton"],
]

artist_songs.each do | artist_name, songs |
   artist = Artist.find_by( name: artist_name )

   songs.each do | title, cover, lyrics, genres |
      song = Song.create( title:title, artist_id: artist.id, cover: cover, lyrics: lyrics)

        genres.split( ", ").each do |genre_name|
           if genre = Genre.find_by( name: genre_name )
           else
              genre = Genre.create( name: genre_name )
           end

           GenresSongs.create( song: song, genre: genre )
      end
   end
end
