require_relative "rankable"

module Oscar
	class Song
		include Rankable

		attr_accessor :title, :rank

		def initialize(title, rank)
		  @title = title
		  @rank = rank
		end

		def to_s
			"#{@title} has a rank of #{@rank} (#{status}"
		end
	end

	if __FILE__ == $0
		song.Song.new("Mamamia", 30)
		song.thumbs_down
		puts song
		song.thumbs_up
		puts song
	end
end