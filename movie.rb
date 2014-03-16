class	Movie	
	def initialize(title, rank=0)
	  @title = title.capitalize
	  @rank = rank
	end

	def to_s # meta programming
		"#{@title} has a rank of #{@rank}"
	end

	def thumbs_up
		@rank += 1	
	end

	def thumbs_down
		@rank -= 1
	end

end


movie1 = Movie.new("gravity", 20)
movie1.thumbs_up
puts movie1

movie2 = Movie.new("Wall Street", 20)
movie2.thumbs_down
puts movie2