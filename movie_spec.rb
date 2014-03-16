require_relative "movie"

describe ::Movie do
	let(:initial_rank) { 20 }
	let(:movie) { ::Movie.new("gravity", initial_rank) }


  it "has a capitalized title" do
  	# movie.title.should == "Gravity"
  	expect(movie.title).to eql("Gravity")
  end
  it "has a initial rank" do
  	# movie.rank.should == 20
  	expect(movie.rank).to eql(20)
  end
end