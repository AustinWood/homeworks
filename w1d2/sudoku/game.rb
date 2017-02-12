require_relative 'board.rb'

class Game
  attr_reader :board

  def initialize(file_path = "sudoku1.txt")
    @board = Board.new(file_path)
  end

  def play
    until game_over?
      @board.display
      coords = coordinates(@board)
      @board[*coords] = user_num(coords)
    end
  end

  def coordinates(board)
    puts "Enter coordinates:"
    print ">"
    guess = gets.chomp
    until valid_input?(guess)
      guess = gets.chomp
    end
    str_to_coords(guess)
  end

  def valid_input?(guess)
    return false unless valid_format?(guess)
    coords = str_to_coords(guess)
    unless in_range?(coords) && given?(coords)
      puts "Invalid input! Try again."
      print ">"
      return false
    end
    true
  end

  def valid_format?(str)
    /\d+\,\s?\d+/ =~ str
  end

  def str_to_coords(str)
    no_space = str.split.join
    no_space.split(',').map { |e| e.to_i }
  end

  def in_range?(coords)
    @board[*coords]
  end

  def given?(coords)
    !@board[*coords].given
  end

  def game_over?
    @board.full?
  end

  def user_num(coords)
    guess = 10
    until @board.valid_guess?(coords, guess)
      puts "Now enter a number:"
      guess = gets.chomp.to_i
    end
    guess
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(*ARGV)
  game.play
end
