require_relative "static_array"
require 'byebug'

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(0)
    @length = 0
    @start_idx = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index < 0 || index >= self.length
    self.store[(self.start_idx + index) % self.capacity]
  end

  # O(1)
  def []=(index, val)
    raise 'index out of bounds' if index < 0 || index >= self.length
    self.store[(self.start_idx + index) % self.capacity] = val
  end

  # O(1)
  def pop
    popped_el = self[self.length - 1]
    self[self.length - 1] = nil
    self.length -= 1
    popped_el
  end

  # O(1) ammortized
  def push(val)
    self.resize! if self.length == self.capacity
    self.length += 1
    self[self.length - 1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if self.length == 0
    shifted_el = self[0]
    self[0] = nil
    self.start_idx += 1
    self.length -= 1
    shifted_el
  end

  # O(1) ammortized
  def unshift(val)
    self.resize! if self.length == self.capacity

    self.start_idx = (self.start_idx - 1) % self.capacity
    self.length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def resize!
    resized_ring = StaticArray.new(self.capacity * 2)
    self.length.times { |i| resized_ring[i] = self[i] }
    self.store = resized_ring
    self.start_idx = 0
    self.capacity = self.capacity * 2
  end
end
