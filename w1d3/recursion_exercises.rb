def range(start, finish)
  return [] if finish < start
  range(start, finish - 1) + [finish]
end

def sum_recursive(arr)
  return 0 if arr.empty?
  arr.first + sum_recursive(arr.drop 1)
end

def sum_iterative(arr)
  sum = 0
  arr.each { |el| sum += el }
  sum
end

def sum_inject(arr)
  arr.inject(:+)
end

def exp(base, power)
  return 1 if power.zero?
  base * exp(base, power - 1)
end

def exp_optimized(base, power)
  return 1 if power.zero?
  return base if power == 1
  val = exp_optimized(base, power / 2)
  val * val * (power % 2 == 0 ? 1 : base)
end

class Array
  def deep_dup
    return self.dup unless self.any? { |el| el.is_a?(Array) }
    arr_dup = []
    self.each { |el| arr_dup << (el.is_a?(Array) ? el.deep_dup : el) }
    arr_dup
  end

  # def deep_dup_map
  #   return self.dup unless self.any? { |el| el.is_a?(Array) }
  #   self.dup.map { |el| el.is_a?(Array) ? el.deep_dup_map : el }
  # end
end

def fibonacci_r(n)
  return n.zero? ? [1] : [1, 1] if n <= 1
  arr = fibonacci(n - 1)
  arr << arr[-1] + arr[-2]
end

def fibonacci_i(n)
  arr = (n.zero? ? [1] : [1, 1])
  (2..n).each do |i|
    arr << arr[i - 2] + arr[i - 1]
  end
  arr
end

class Array
  def subsets
    return [[]] if self.empty?
    subsets_without_el = self.drop(1).subsets
    subsets_with_el = subsets_without_el.map { |subset| subset += [self.first] }
    subsets_with_el.concat(subsets_without_el)
  end
end

def permutations(arr)
  return [arr, arr.reverse] if arr.length == 2
  sub_perms = permutations(arr.drop(1))
  results = []
  (0..(arr.length - 1)).each do |i|
    sub_perms_dup = sub_perms.deep_dup
    results << sub_perms_dup.map { |el| el.insert(i, arr.first) }
  end
  results.flatten(1)
end

def bsearch(arr, val)
  mid_i = (arr.length) / 2
  mid_v = arr[mid_i]
  return mid_i if val == mid_v
  return bsearch(arr[0...mid_i], val) if val < mid_v
  (mid_i += 1) + bsearch(arr[mid_i..-1], val)
end

def merge_sort(arr)
  return arr if arr.length <= 1
  slices = arr.each_slice((arr.length / 2.0).ceil).to_a
  slices.map! { |el| merge_sort(el) }
  merge(slices.first, slices.last)
end

def merge(*slices)
  return slices.flatten(1) if slices.any? { |el| el.empty? }
  slices.reverse! if slices[0].first > slices[1].first
  [slices[0].first].concat(merge(slices[0].drop(1), slices[1]))
end
