require_relative "movie"

describe ::Movie do
	let(:initial_rank) { 20 }
	let(:movie) { ::Movie.new("gravity", initial_rank) }

  it "has a capitalized title" do
  	# movie.title.should == "Gravity"
  	expect(movie.title).to eql("Gravity")
  end

  it "GET #rank" do
  	# movie.rank.should == 20
  	expect(movie.rank).to eql(initial_rank)
  end

  it "has a description" do
  	expect(movie.to_s).to eql("Gravity has a rank of 20")
  end

  it "GET #thumbs_up" do
  	expect(movie.thumbs_up).to eql(initial_rank+1)
  end

  it "decreases rank by 1 when given a thumbs down" do
  	expect(movie.thumbs_down).to eql(initial_rank-1)
  end

end