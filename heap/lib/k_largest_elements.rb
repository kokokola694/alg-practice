require_relative 'heap'

def k_largest_elements(array, k)
  result = []
  max_prc = Proc.new { |el1, el2| el2 <=> el1 }
  heap = BinaryMinHeap.new(&max_prc)
  
  heap.push(array.pop) until array.empty?
  k.times { result << heap.extract }
  result
end
