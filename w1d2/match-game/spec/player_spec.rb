require 'rspec'
require 'player'

RSpec.describe Player do
  player = Player.new
  context "valid_input" do
    it "accepts valid user input" do
      expect(player.valid_input?("1, 2")).to eq(true)
    end

    it "rejects too large inputs" do
      expect(player.valid_input?("9, 9")).to eq(false)
    end
  end

  context "str_to_coords" do
    it "converts user input to coordinates" do
      expect(player.str_to_coords("3, 4")).to eq([3, 4])
    end

    it "continue until valid_input" do
      expect(player.str_to_coords("9, 9")).to eq([3, 4])
    end
  end
end
