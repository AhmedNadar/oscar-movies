require_relative "playlist"

	movie1 = Movie.new("gravity", 20)
	movie2 = Movie.new("wall street", 3)
	movie3 = Movie.new("frozen", 16)

	playlist1 = Playlist.new("Oscar")
	playlist1.add_movie(movie1)
	playlist1.add_movie(movie2)
	playlist1.add_movie(movie3)
	playlist1git.play

	playlist2 = Playlist.new("Kermit")
	playlist2.add_movie(movie3)

	movie4 = Movie.new("12 years", 18)
	playlist2.add_movie(movie4)
	playlist2.play