class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [:stone] * 4 }
    @cups[6], @cups[13] = [], []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos >= @cups.length || start_pos <= 1
      raise ArgumentError.new "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
  stones = @cups[start_pos]
  @cups[start_pos] = []
  cup_idx = start_pos
  until stones.empty?
    cup_idx += 1
    cup_idx = 0 if cup_idx > 13
    if cup_idx == 6
      @cups[6] << stones.pop if current_player_name == @name1
    elsif cup_idx == 13
      @cups[13] << stones.pop if current_player_name == @name2
    else
      @cups[cup_idx] << stones.pop
    end
  end
  render
  next_turn(cup_idx)
end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
