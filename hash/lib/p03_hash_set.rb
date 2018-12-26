require_relative 'p02_hashing'

class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self.include?(key)
    resize! if self.count == num_buckets
    self[key] << key
    self.count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return unless self.include?(key)
    self[key].delete(key)
    self.count -= 1
  end

  private

  def [](num)
    index = num.hash % num_buckets
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
