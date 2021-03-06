require_relative "snack_bar"
require_relative "rankable"

module Oscar
	class	Movie	
		include Rankable

		attr_accessor :title, :rank

		def initialize(title, rank=0)
		  @title = title.capitalize
		  @rank = rank
		  @snack_carbs = Hash.new(0)
		end

		def each_snack
			@snack_carbs.each do |name, carbs|
				snack = Snack.new(name, carbs)
				yield snack
			end
		end

		def carbs_consumed
			@snack_carbs.values.reduce(0, :+)	
		end

		def self.from_csv(line)
			title, rank = line.split(',')
			Movie.new(title, Integer(rank))
		end

		def to_csv
			"#{@title}, #{@rank}"
		end

		def ate_snack(snack)
			@snack_carbs[snack.name] += snack.carbs
			puts "#{@title} let to (#{snack.carbs}) #{snack.name} carbs being consumed"
			puts "#{@title}'s snack: #{@snack_carbs}"
		end

		def to_s # meta programming
			"#{@title} has a rank of #{@rank} (#{status})"
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
end