class Card
  attr_reader :sym, :face_up

  def initialize(sym)
    @sym = sym
    @face_up = false
  end

  def flip
    @face_up = !@face_up
  end

end
