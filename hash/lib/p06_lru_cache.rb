require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count, :map, :prc, :store, :max
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    self.map.count
  end

  def get(key)
    if map[key]
      node = map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = self.prc.call(key)
    new_node = self.store.append(key, val)
    map[key] = new_node

    eject! if self.count > self.max

    val
  end

  def update_node!(node)
    node.remove
    self.map[node.key] = self.store.append(node.key, node.val)
  end

  def eject!
    removed_node = self.store.first
    removed_node.remove
    map.delete(removed_node.key)
    nil
  end
end
