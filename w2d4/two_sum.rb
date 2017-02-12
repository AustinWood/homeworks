def brute_force?(arr, target)
  arr.each.with_index do |el1, i|
    arr.each.with_index do |el2, j|
      next if i == j
      return true if el1 + el2 == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.each.with_index do |el, i|
    dup = arr.dup
    dup.delete_at(i)
    val = target - el
    return true if bsearch(dup, val)
  end
  false
end

def bsearch(arr, val)
  return nil if arr.empty?
  mid = arr.length / 2
  return mid if arr[mid] == val
  if arr[mid] > val
    bsearch(arr[0...mid], val)
  else
    result = bsearch(arr[(mid+1)..-1], val)
    result.nil? ?  nil : result + mid + 1
  end
end
arr = [0, 1, 5, 7]
# puts okay_two_sum?(arr, 6)

def two_summer?(arr, val)
  hash = Hash.new(false)
  arr.each { |el| hash[el] = true }
  arr.each do |el|
    target = val - el
    return true if hash[target]
  end
  false
end


# def four_sum?(arr, val)
#   hash = Hash.new(false)
#   arr.each { |el| hash[el] = true }
#   arr.each do |el|
#     target = val - el
#     return true if hash[target]
#   end
#   false
# end

def four_sum?(arr, val)
  until arr.empty?
    current = arr.shift
    arr.each.with_index do |el, i|
      two_sum_target = val - el - current
      small_arr = arr[0...i] + arr[(i+1)..-1]
      return true if two_summer?(small_arr, two_sum_target)
    end
  end
  false
end

a = [3, 1, 2, 7, 5, 3]

puts four_sum?(a, 15)
