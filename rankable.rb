module Rankable
	def thumbs_up
		self.rank += 1	
	end

	def thumbs_down
		self.rank -= 1
	end

	def winner?
		self.rank >= 20
	end

	def status
		winner? ? "Winner!" : "Loser!"
	end

	def <=>(other)
		other.rank <=> self.rank
	end
end