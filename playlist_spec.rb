require_relative "playlist"

describe ::Playlist do
  let(:playlist) { ::Playlist.new("Oscar") }

  it "has a name" do
  	expect(playlist.name).to eql("Oscar")
  end

  context 'being played with one movie' do
		let(:initial_rank) { 20 }
		let(:movie) { ::Movie.new("gravity", initial_rank) }
		before	{playlist.add_movie(movie)}

		it "gives the movie thumbs up if a high number is rolled" do
			Reviewer.stub(:roll_die).and_return(20)
			playlist.play(2)
			expect(movie.rank).to eql(initial_rank+2)

			Reviewer.stub(:roll_die).and_return(19)
			playlist.play(2)
			expect(movie.rank).to eql(initial_rank+4)
		end
		
		it "skips the movie if a medium number is rolled" do
			Reviewer.stub(:roll_die).and_return(10)
			playlist.play(2)
			expect(movie.rank).to eql(initial_rank)

			Reviewer.stub(:roll_die).and_return(13)
			playlist.play(2)
			expect(movie.rank).to eql(initial_rank)
		end

		it "gives the movie thumbs down if a lower number is rolled" do
			Reviewer.stub(:roll_die).and_return(2)
			playlist.play(2)
			expect(movie.rank).to eql(initial_rank-2)

			Reviewer.stub(:roll_die).and_return(4)
			playlist.play(2)
			expect(movie.rank).to eql(initial_rank-4)
		end
  end

  context 'with movies that have casued snacks to be consumed' do
  	before	do
  		movie1 = Movie.new("gravity") 
	  	movie2 = Movie.new("godfather") 
			
			playlist.add_movie(movie1)
			playlist.add_movie(movie2)

	  	movie1.ate_snack(Snack.new(:popcorn, 10))
	  	movie1.ate_snack(Snack.new(:popcorn, 10))
	  	movie2.ate_snack(Snack.new(:juice, 5))
  	end

  	it "computes total carbs consumed as the sum of all mocies carbs consumed" do
  		expect(playlist.total_carbs_consumed).to eql(25)
  	end
  end
end