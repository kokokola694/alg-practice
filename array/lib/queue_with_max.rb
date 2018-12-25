# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_values = RingBuffer.new
  end

  def enqueue(val)
    self.store.push(val)
    while @max_values.length > 0 && @max_values[@max_values.length - 1] < val
      @max_values.pop
    end
    @max_values.push(val)
  end

  def dequeue
    val = self.store.shift
    @max_values.shift if val == self.max
    val
  end

  def max
    @max_values[0] if @max_values.length > 0
  end

  def length
    self.store.length
  end

end
