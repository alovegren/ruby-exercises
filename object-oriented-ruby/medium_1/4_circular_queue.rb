require "pry"

# class CircularQueue
#   def initialize(buffer_size)
#     @buffer = []
#     @buffer_size = buffer_size
#   end

#   def enqueue(obj)
#     dequeue if max_size?
#     buffer << obj
#   end

#   def dequeue
#     buffer.shift
#   end

#   def max_size?
#     buffer.size == buffer_size
#   end                  

#   private

#   attr_reader :buffer, :buffer_size
# end

# My solution above passes the test cases, but it doesn't truly adhere to all of the characteristics of a circular buffer; it's not a fixed size array which has any distinction between older and newer elements. I've read the LS solution now but I'll tru to code my own without reference to it: 

class CircularQueue
  def initialize(size)
    @size = size
    @buffer = [nil] * size
    @oldest_position = 0
    @next_position = oldest_position
  end

  def enqueue(obj)
    if open_positions?
      buffer[next_position] = obj
      self.next_position = increment(next_position)
    else
      dequeue
      enqueue(obj)
    end
  end

  def dequeue
    dequeued_obj = buffer[oldest_position]
    buffer[oldest_position] = nil
    self.oldest_position = increment(oldest_position) if dequeued_obj
    
    dequeued_obj
  end

  private

  def increment(position)
    position = ((position += 1) % size)
  end

  def open_positions?
    buffer.any?(&:nil?)
  end

  attr_reader :size
  attr_accessor :buffer, :oldest_position, :next_position
end

queue = CircularQueue.new(3)

puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
