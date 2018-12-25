require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(0);
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if index >= self.length || index < 0
      raise 'index out of bounds'
    else
      self.store[index]
    end
  end

  # O(1)
  def []=(index, value)
    self.store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if self.length == 0
    self[length - 1] = nil
    self.length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    self.resize! if self.length == self.capacity
    self.length += 1
    self[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if self.length == 0
    (0..self.length-1).each do |index|
      index == self.length - 1 ?
        self[index] = nil :
        self[index] = self[index + 1]
    end
    self.length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.push(val)
    (self.length-1).downto(1).each do |index|
      self[index], self[index - 1] = self[index - 1], self[index]
    end
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  # O(n): has to copy over all the elements to the new store.
  def resize!
    self.capacity = self.capacity * 2
  end
end
