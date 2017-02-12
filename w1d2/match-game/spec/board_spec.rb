require 'rspec'
require 'board'

RSpec.describe Board do
  context "populate" do
    it "returns an 8x8 array" do
      test_board = Board.new
      board_length = test_board.board.length
      depth = test_board.board[0].length
      expect(board_length && depth).to eq(8)
    end
  end
end
