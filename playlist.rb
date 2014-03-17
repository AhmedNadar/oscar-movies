require_relative "movie"
require_relative "reviewer"

class Playlist
	attr_reader :name

	def initialize(name)
	  @name = name
	  @movies = [ ]
	end

	def add_movie(movie)
		@movies << movie
	end

	def play(viewings)
		puts "\n*** #{@name}'s playlist:"
		puts	@movies.sort
		1.upto(viewings) do |count|
			puts "\nViewing #{count}:"
			@movies.each do |movie|
				Reviewer.review(movie)
				puts movie
			end
		end
	end

	def print_stats
		puts "\n#{@name}'s Stats:"
		winners, losers = @movies.partition { |movie| movie.winner? }

		puts "\nWinners:"
		puts winners.sort

		puts	"\nLosers:"
		puts losers.sort
	end
end