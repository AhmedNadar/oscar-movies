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
			playlist.play
			expect(movie.rank).to eql(initial_rank+1)

			Reviewer.stub(:roll_die).and_return(19)
			playlist.play
			expect(movie.rank).to eql(initial_rank+2)
		end
		
		it "skips the movie if a medium number is rolled" do
			Reviewer.stub(:roll_die).and_return(10)
			playlist.play
			expect(movie.rank).to eql(initial_rank)

			Reviewer.stub(:roll_die).and_return(13)
			playlist.play
			expect(movie.rank).to eql(initial_rank)
		end

		it "gives the movie thumbs down if a lower number is rolled" do
			Reviewer.stub(:roll_die).and_return(5)
			playlist.play
			expect(movie.rank).to eql(initial_rank-1)

			Reviewer.stub(:roll_die).and_return(4)
			playlist.play
			expect(movie.rank).to eql(initial_rank-2)
		end
  end
end