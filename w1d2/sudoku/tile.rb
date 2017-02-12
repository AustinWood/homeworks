class Tile
  attr_reader :value, :given

  def initialize(value)
    @value = value
    @given = !value.zero?
  end

  def assign_value(value)
    @value = value unless @given
  end

end
