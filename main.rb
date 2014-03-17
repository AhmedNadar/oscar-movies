require_relative "playlist"
require_relative "movie3d"

	movie1 = Movie.new("gravity", 20)
	movie2 = Movie.new("wall street", 3)
	movie3 = Movie.new("frozen", 16)

	playlist = Playlist.new("Oscar")
	# stor command line argument in ARGF
	playlist.load(ARGV.shift || "movies.csv")

	movie3d = Movie3D.new("dianasors", 5, 20)
	playlist.add_movie(movie3d)

loop do
	puts "\nHow many viewings you want to see? ('quit' to exit)"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		playlist.play(answer.to_i)
	when 'quit', 'exit'
		playlist.print_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end
end
playlist.save
	