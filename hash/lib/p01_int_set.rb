class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num]
  end

  private

  def is_valid?(num)
    num.between?(0,self.max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return if self.include?(num)
    self[num] << num
  end

  def remove(num)
    return unless self.include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    index = num % num_buckets
    self.store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self.include?(num)
    resize! if self.count == num_buckets
    self[num] << num
    self.count += 1
  end

  def remove(num)
    return unless self.include?(num)
    self[num].delete(num)
    self.count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    index = num % num_buckets
    self.store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    elements = self.store.flatten
    self.count = 0
    self.store = Array.new(num_buckets * 2) {Array.new}
    elements.each { |el| insert(el) }
  end
end
