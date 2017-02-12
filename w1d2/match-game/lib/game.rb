require_relative 'board.rb'
require_relative 'player.rb'
require "byebug"
class Game
  def initialize(board, *players)
    @players = [*players]
    @board = board
  end

  def play
    until game_over?
      take_turn
      sleep(2)
      switch_player
    end
  end

  def take_turn
    current_moves = moves
    if @board.is_match?(*current_moves)
      current_player.increment_matches
      puts "MATCH! Score: #{current_player.matches}"
    else
      current_moves.each { |coords| @board.flip_card(coords) }
    end
  end

  def moves
    @board.display
    move_one = current_player.coordinates(@board)
    @board.flip_card(move_one)
    @board.display
    move_two = current_player.coordinates(@board)
    @board.flip_card(move_two)
    @board.display
    [move_one, move_two]
  end

  def switch_player
    @players.rotate!
  end

  def current_player
    @players.first
  end

  def game_over?
    @board.all_face_up?
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Enter a board size (must be even):"
  print ">"
  board_size = gets.chomp.to_i
  board = Board.new(board_size)
  game = Game.new(board, Player.new, Player.new("Johhny"))
  game.play
end
