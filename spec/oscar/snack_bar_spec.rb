require "oscar/snack_bar"

module Oscar
  describe Snack do
    let(:snack) { Snack.new(:popcorn, 10) }

    it "has a name attribute" do
    	expect(snack.name).to eql(:popcorn)
    end

    it "has a carbs attribute" do
    	expect(snack.carbs).to eql(10)
    end

    describe SnackBar do
      it "has a full yummy bar" do
      	expect(SnackBar::SNACKS).to_not be_nil
      end

      it "returns a random yummy snack" do
      	expect(SnackBar::SNACKS).to include(snack)
      end
    end
  end
end