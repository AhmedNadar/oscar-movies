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
  	expect(movie.to_s).to eql("Gravity has a rank of 20 (Winner!)")
  end

  it "GET #thumbs_up" do
  	expect(movie.thumbs_up).to eql(initial_rank+1)
  end

  it "decreases rank by 1 when given a thumbs down" do
  	expect(movie.thumbs_down).to eql(initial_rank-1)
  end

  context 'with a default rank' do
  	let(:movie) { ::Movie.new("godfather") }
  	it "has a value of 0" do
  		expect(movie.rank).to eql(0)
  	end
  end

  context 'with a rank of 20 or more' do
  	it "is a winner" do
  		expect(movie.winner?).to eql(true)
  	end

  	it "has a winner status" do
  		expect(movie.status).to eql("Winner!")
  	end
  end

  context 'with a rank of less than 20' do
  	let(:movie) { ::Movie.new("gravity", 19) }
  	it "is a loser" do
  		expect(movie.winner?).to eql(false)
  	end

  	it "has a loser status" do
  		expect(movie.status).to eql("Loser!")
  	end
  end

  it "is sorted by decreasing rank" do
    movie1 = Movie.new("gravity", 100)
    movie2 = Movie.new("madacascar", 200)
    movie3 = Movie.new("godfather", 300)

    movies = [movie1, movie2, movie3]
    expect(movies.sort).to eql([movie3, movie2, movie1])
  end

  it "computes carbs consumed as the sum of all snack carbs consumed" do
    expect(movie.carbs_consumed).to eql(0)
    
    movie.ate_snack(Snack.new(:popcorn, 10))
    expect(movie.carbs_consumed).to eql(10)
    
    movie.ate_snack(Snack.new(:popcorn, 10))
    expect(movie.carbs_consumed).to eql(20)

    movie.ate_snack(Snack.new(:juice, 5))
    expect(movie.carbs_consumed).to eql(25)
  end

  it "yields each snack" do
    movie.ate_snack(Snack.new(:popcorn, 10))
    movie.ate_snack(Snack.new(:popcorn, 10))
    movie.ate_snack(Snack.new(:juice, 5))

    yielded = []
    movie.each_snack do |snack|
      yielded << snack
    end
    expect(yielded).to eql([Snack.new(:popcorn, 20), Snack.new(:juice, 5)])
  end
end