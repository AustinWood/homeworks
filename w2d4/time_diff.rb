list1 = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min(arr)
  minimum = arr.first
  arr.each.with_index do |x, i|
    arr.each.with_index do |y, j|
      minimum = y if y < x && y < minimum
    end
  end
  minimum
end


puts my_min(list1)

def my_better_min(arr)
  minimum = arr.shift
  arr.each do |el|
    minimum = el if el < minimum
  end
  minimum
end

puts my_better_min(list1)

list2 = [2, 3, -6, 7, -6, 7]
def sub_sum(arr)
  sum = arr.first
  arr.each.with_index do |el, i|
    arr.each.with_index do |el2, j|
      next if i > j
      temp = arr[i..j].reduce(:+)
      sum = temp if temp > sum
    end
  end
  sum
end

puts sub_sum(list2)

def better_sub_sum(arr)
  return arr.max if arr.all?{|n| n < 0}
  current = arr.first
  largest = arr.first

  arr.drop(1).each do |el|
    current = 0 if current < 0
    current += el
    largest = current if current > largest
  end

  largest
end
