def solution_1(arr, size)
  current_max_range = nil
  arr.each.with_index do |el, i|
    j = i + size - 1
    break if j >= arr.length
    temp_max = arr[i..j].max - arr[i..j].min
    if current_max_range.nil? || temp_max > current_max_range
      current_max_range = temp_max
    end
  end
  current_max_range
end

puts solution_1([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
puts solution_1([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
puts solution_1([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
puts solution_1([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = [MyStack.new]
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.dup
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader :min, :max

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def push(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
    @store << el
    el
  end

  def pop
    popped = @store.pop
    @max = @store.max if popped == @max?
    @min = @store.min if popped == @min?
    popped
  end

  def peek
    @store.dup
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
