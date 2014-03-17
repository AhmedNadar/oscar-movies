require_relative "playlist"

	movie1 = Movie.new("gravity", 20)
	movie2 = Movie.new("wall street", 3)
	movie3 = Movie.new("frozen", 16)

	playlist = Playlist.new("Oscar")
	# stor command line argument in ARGF
	playlist.load(ARGV.shift || "movies.csv")

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
	