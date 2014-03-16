class	Movie	
	attr_reader :title
	attr_accessor :rank

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

if __FILE__ == $0
	movie1 = Movie.new("gravity", 20)
	puts movie1.thumbs_up
	puts movie1.title
	puts movie1

	movie2 = Movie.new("wall street", 3)
	puts movie2.thumbs_down
	puts movie2.rank
	puts movie2

	movie3 = Movie.new("frozen", 3)
	puts movie3.thumbs_up
	puts movie3.rank
	puts movie3
end