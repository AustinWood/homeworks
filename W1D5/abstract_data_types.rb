# Exercise 1 - Stack
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

# Exercise 2 - Queue
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

# Exercise 3 - Map
class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    found_key = false
    @map.each do |el|
      if el[0] == key
        el[1] = value
        found_key = true
      end
    end
    @map << [key, value] unless el_index
  end

  def lookup(key)
    @map.each { |el| return el[1] if el[0] == key }
    nil
  end

  def remove(key)
    @map.each_with_index do |el, i|
      @map.delete_at(i) if el[0] == key
    end
  end

  def show
    @map.dup
  end
end
