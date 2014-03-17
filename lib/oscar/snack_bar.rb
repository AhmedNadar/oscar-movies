Snack = Struct.new(:name, :carbs)

module Oscar
	module SnackBar
		SNACKS = [
			Snack.new(:popcorn, 10),
			Snack.new(:juice, 20),
			Snack.new(:candy, 30),
			Snack.new(:pretzel, 40),
			Snack.new(:nachos, 50)
		]

		def self.random
			SNACKS.sample
		end
	end
	if __FILE__ == $0
		puts SnackBar::SNACKS
		puts SnackBar.random
	end
end