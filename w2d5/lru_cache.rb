class LRUCache
  CACHE_SIZE = 4

  def initialize

  end

  def count
    # returns number of elements currently in cache
  end

  def add(el)
    # adds element to cache according to LRU principle
  end

  def show
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end

class LinkedList
  def initialize
    @head = MyLink.new
    @tail = MyLink.new
    @head.next = @tail
    @tail.prev = head
  end
end

class MyLink
  def initialize
    @next = nil
    @prev = nil
  end

  def next(link)
    @next = link
  end

  def prev(link)
    @prev = link
  end
end
