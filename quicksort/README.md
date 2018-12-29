# Quick Sort
Quick sort is a very popular sorting algorithm, and this practice project goes over two implementations. The first implementation takes up a lot of space because for every recursive call, new arrays are created. We improve this solution to a sub-linear space complexity solution. At worst case, quick sort runs at `O(n^2)` while on average it runs at `O(n log n)`.

### In-place Quick Sort

Steps
* Base Case: return if `length <= 1`
* Select pivot element (first in this case)
* Partition array around the pivot
* Recurse on the left and right
