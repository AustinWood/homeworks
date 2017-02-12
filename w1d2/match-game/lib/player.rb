require "byebug"
class Player
  attr_reader :name, :matches

  def initialize(name = 'Compy')
    @name = name
    @matches = 0
  end

  def coordinates(board)
    puts "#{@name}, enter coordinates:"
    print ">"
    guess = gets.chomp
    until valid_input?(guess, board)
      guess = gets.chomp
    end
    str_to_coords(guess)
  end

  # THREE CHECKS:
  # Valid format (num comma number)
  # In range (card is not nil)
  # Face down
  def valid_input?(guess, board)
    return false unless valid_format?(guess)
    coords = str_to_coords(guess)
    unless in_range?(coords, board) && face_down?(coords, board)
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

  # TODO Move to Board.class
  def in_range?(coords, board)
    board[*coords]
  end

  # TODO Move to Board.class
  def face_down?(coords, board)
    !board[*coords].face_up
  end

  def increment_matches
    @matches += 1
  end

end
