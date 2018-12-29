require_relative "heap"

class Array
  def heap_sort!
    (1...length).each do |i|
      BinaryMinHeap.heapify_up(self, i)
    end

    length.downto(1).each do |i|
      self[i - 1], self[0] = self[0], self[i - 1]
      BinaryMinHeap.heapify_down(self, 0, i - 1)
    end

    self.reverse!

  end
end
