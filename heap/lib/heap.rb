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
  end

  def peek
  end

  def push(val)
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

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    
  end
end
