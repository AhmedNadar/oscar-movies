require_relative "movie"
require_relative "reviewer"
require_relative "snack_bar"

class Playlist
	attr_reader :name

	def initialize(name)
	  @name = name
	  @movies = [ ]
	end

	def load(from_file)
		File.readlines(from_file).each do |line|
			add_movie(Movie.from_csv(line))
		end
	end

	def save(to_file="movie_rankings.csv" )
		File.open(to_file, "w") do |file| # w mode for writing
			file.puts @movies.sort.map { |movie| movie.to_csv }
			# @movies.sort.each do |movie|
			# 	file.puts movie.to_csv
			# end
		end
	end

	def add_movie(movie)
		@movies << movie
	end

	def play(viewings)
		puts "\n*** #{@name}'s playlist:"
		puts	@movies.sort

		snacks = SnackBar::SNACKS
		puts "\nThere are #{snacks.size} snacks available in the snack bar."

		snacks.each do |snack|
			puts "#{snack.name.capitalize} has (#{snack.carbs}) carbs."
		end

		1.upto(viewings) do |count|
			puts "\nViewing #{count}:"
			@movies.each do |movie|
				Reviewer.review(movie)

				snack = SnackBar.random
				movie.ate_snack(snack)
				puts movie
			end
		end
	end

	def total_carbs_consumed
		@movies.reduce(0) do |sum, movie|
			sum + movie.carbs_consumed
		end
	end

	def print_stats
		puts "\n#{@name}'s Stats:"
		
		winners, losers = @movies.partition { |movie| movie.winner? }

		puts "\nWinners:"
		puts winners.sort

		puts	"\nLosers:"
		puts losers.sort
		
		puts "#{total_carbs_consumed} total carbs consumed"
		@movies.sort.each	do |movie|
			puts "\n#{movie.title}'s snack totals:"
			movie.each_snack do |snack|
				puts "#{snack.carbs} totla #{snack.name.capitalize}"
			end
			puts "#{movie.carbs_consumed} grand total carbs."
		end
	end
end