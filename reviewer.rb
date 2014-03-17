module Reviewer
	def self.roll_die
		rand(1..20)
	end

	def self.review(movie)
		case roll_die
		when 1..9				
			movie.thumbs_down
			puts "#{movie.title} got a thumbs down."
		when 10..17
			puts "#{movie.title} was skipped."
		else
			movie.thumbs_up
			puts "#{movie.title} got a thumbs up."
		end
	end
end