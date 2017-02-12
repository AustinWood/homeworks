require "byebug"
require_relative 'tile.rb'

class Board
  def initialize(file_path)
    @puzzle = create_puzzle(file_path)
  end

  def create_puzzle(file_path)
    File.readlines(file_path).map do |line|
      line.chomp.split('').map { |str| Tile.new(str.to_i) }
    end
  end

  def [](row, col)
    @puzzle[row][col]
  end

  def []=(row, col, value)
    @puzzle[row][col].assign_value(value)
  end

  def display
    system('clear' || 'clr')
    @puzzle.each { |row| p row.map { |tile| tile.value } }
  end

  def full?
    @puzzle.flatten.all? { |tile| !tile.value.zero? }
  end

  def valid_guess?(coordinates, num)
    fits_in_row?(coordinates, num) &&
    fits_in_col?(coordinates, num) &&
    num.between?(1, 9)
  end

  # TODO: Please rename this... please...

  def awesome_proc
    Proc.new { |tile, num| tile.value == num }
  end
  
  def fits_in_row?(coordinates, num)
    @puzzle[coordinates[0]].include?(num:&awesome_proc)
  end

  def fits_in_col?(coordinates, num)
    @puzzle.transpose[coordinates[1]].include?(&awesome_proc)
  end

end
