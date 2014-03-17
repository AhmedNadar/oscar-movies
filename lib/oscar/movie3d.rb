require_relative "movie"

module Oscar
	class Movie3D < Movie

		def initialize(title, rank, wow_factor)
			super(title, rank)
			@wow_factor = wow_factor
		end

		def thumbs_up
			@wow_factor.times {super}
		end

		def show_effect
			puts "Wow!" * @wow_factor
		end
	end

	if __FILE__ == $0
		movie3d = Movie3D.new("gravity", 5, 20)
		puts "3D movie: #{movie3d.title}"
		puts "Initial rank: #{movie3d.rank}"
		movie3d.thumbs_up
		puts "Rank after thumbs up: #{movie3d.rank}"
		puts movie3d
		movie3d.show_effect
	end
end