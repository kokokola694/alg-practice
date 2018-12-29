class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc ||= Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    self.store.length
  end

  def extract
    self.store[0], self.store[-1] = self.store[-1], self.store[0]
    extracted = self.store.pop
    BinaryMinHeap.heapify_down(self.store, 0, self.store.length, &prc)
    extracted
  end

  def peek
    self.store[0]
  end

  def push(val)
    self.store.push(val)
    BinaryMinHeap.heapify_up(self.store, self.count - 1, self.store.length, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    c1_idx = parent_index * 2 + 1
    c2_idx = parent_index * 2 + 2
    [c1_idx, c2_idx].select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    children = child_indices(len, parent_idx)

    return array if children.all? do |child_i|
      prc.call(array[parent_idx, array[child_i]]) < 1
    end

    if children.length == 1
      swap_idx = children[0]
    elsif prc.call(array[children[0]], array[children[1]]) == -1
      swap_idx = children[0]
    else
      swap_idx = children[1]
    end

    array[swap_idx], array[parent_idx] = array[parent_idx], array[swap_idx]
    heapify_down(array, swap_idx, len, &prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2 }
    return array if child_idx == 0
    parent = parent_index(child_idx)

    return array if prc.call(array[parent], array[child_idx]) < 1

    array[child_idx], array[parent] = array[parent], array[child_idx]
    heapify_up(array, parent, len, &prc)
  end
end
