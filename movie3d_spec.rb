require_relative "movie3d"

describe "Movie3D" do
  let(:initial_rank) { 20 }
  let(:wow_factor) { 5 }
	let(:movie) { ::Movie3D.new("hobbit", initial_rank, wow_factor) }

	it "has a title" do
		expect(movie.title).to eql("Hobbit")
	end

	it "has a rank" do
		expect(movie.rank).to eql(20)
	end

	xit "has a wow factor" do
		expect(movie.wow_factor).to eql(5)
	end

	it "increases rank by 1 times the wow factor when given a thumbs up" do
		movie.thumbs_up
		expect(movie.rank).to eql(initial_rank + (1 * wow_factor))
	end

	it "decreases rank by 1 when given a thumbs down" do
		movie.thumbs_down
		expect(movie.rank).to eql(initial_rank - 1)
	end
end