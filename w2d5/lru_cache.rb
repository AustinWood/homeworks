class LRUCache
  CACHE_SIZE = 4

  def initialize
    @hash_map = Hash.new(nil)
    @linked_list = LinkedList.new
  end

  def count
    @hash_map.count
  end

  def add(el)
    @hash_map
  end

  def show
    current_link = @linked_list.head
    until current_link.next = nil
      current_link = current_link.next
      p current_link.value
    end
  end

  private
  # helper methods go here!

end

class LinkedList
  attr_reader :head, :tail, :value

  def initialize
    @head = MyLink.new
    @tail = MyLink.new
    @head.next = @tail
    @tail.prev = head
  end

  def add(el)
    new_link = MyLink.new(el, @tail)
  end
end

class MyLink
  def initialize(val = nil, next_link = nil)
    @next = next_link
    @prev = nil
    @val = val
  end

  def next(link)
    @next = link
  end

  def prev(link)
    @prev = link
  end
end
