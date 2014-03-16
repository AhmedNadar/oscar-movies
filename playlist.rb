require_relative "movie"

class Playlist
	def initialize(name)
	  @name = name
	  @movies = [ ]
	end

	def add_movie(movie)
		@movies << movie
	end
	def roll_die
		rand(1..20)
	end

	def play
		puts "\n*** #{@name}'s playlist:"
		puts	@movies

		@movies.each do |m|
			number_rolled = roll_die
			if number_rolled < 6				
				m.thumbs_down
				puts "#{m.title} got a thumbs down."
			elsif number_rolled < 11
				puts "#{m.title} was skipped."
			else
				m.thumbs_up
				puts "#{m.title} got a thumbs up."
			end
			puts m
		end
	end
end