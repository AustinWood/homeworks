require_relative 'card.rb'

class Board
  attr_reader :size, :board

  def initialize(size = 8)
    @size = size
    @board = populate
  end

  def populate
    num_symbols = @size ** 2 / 2
    symbols = ((1..num_symbols).to_a * 2).shuffle
    flat_board = symbols.map { |sym| Card.new(sym) }
    container = []
    container << flat_board.pop(@size) until flat_board.empty?
    container
  end

  def display
    system('clear' || 'clr')
    @board.each do |row|
      p row.map { |el| [pad(el.sym), el.face_up] }
    end
  end

  def pad(sym)
    sym < 10 ? " #{sym}" : "#{sym}"
  end

  def is_match?(move_one, move_two)
    self[*move_one].sym == self[*move_two].sym
  end

  def [](row, col)
    return nil if row >= @board.length || col >= @board[row].length
    @board[row][col]
  end

  def flip_card(coords)
    self[*coords].flip
  end

  def all_face_up?
    @board.flatten.all? { |el| el.face_up }
  end

end
