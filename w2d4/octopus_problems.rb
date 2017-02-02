FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def quadratic_octopus
  FISH.each_with_index do |fish_1, i|
    biggest = true
    FISH.each_with_index do |fish_2, j|
      next if i == j
      biggest = false if fish_1.length < fish_2.length
    end
    return fish_1 if biggest
  end
end

class Array
  def merge_sort
    return self if length <= 1
    mid_i = length / 2
    left = take(mid_i).merge_sort
    right = drop(mid_i).merge_sort
    merge(left, right)
  end

  def merge(left, right)
    result = []
    until left.empty? || right.empty?
      result << (left.first.length < right.first.length ? left.shift : right.shift)
    end
    result + left + right
  end

end

def log_linear_octopus
  FISH.merge_sort.last
end

def linear_octopus
  largest = FISH.first
  FISH.each do |fish|
    largest = fish if fish.length > largest.length
  end
  largest
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction)
  TILES_ARRAY.each_with_index do |tile, i|
    return i if tile == direction
  end
end

TILES_HASH = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction)
  TILES_HASH[direction]
end

if __FILE__ == $PROGRAM_NAME
  puts quadratic_octopus
  puts log_linear_octopus
  puts linear_octopus
end
