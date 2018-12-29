# Heaps

This practice project implements a binary min heap - essentially a complete binary tree where the parent node has a value less than or equal to that of the children node.

Note: A "complete" tree adds nodes from top level to bottom, left to right.

### Heap Properties
In a min heap, parents will always have a value that is less than those of their children nodes. By the tree structure of the heap, we know that we can find a node's children by taking its index `i` and looking at `2i + 1` and `2i + 2`. Conversely, a node's parent can be found by taking the child's index `j` and looking at `(j - 1) / 2`, where `/` returns the floored integer.

### Public Methods

* `#peek` lets us know the minimum element in `O(1)`. We implement this by simply looking at the root node of the tree (or the first element of the array).

* `#insert` adds an element into the heap, and places it in a valid position. This process involves inserting the node at the end of the array / tree, and swapping with parent nodes until it ends up at a valid position. This method will take time that is at most the number of levels in the tree, so at worst, it will take `O(log n)` time.

* `#extract` takes out the minimum element and returns it. To maintain the tree structure and the parent-children relationship, we switch the first and last elements in the heap, remove the minimum (now last) element, and then heapify-up the swapped node into a valid position. Again, this will take `O(log n)` time.

### Heap Sort
Heap sort always runs in `O(n log n)` time. It is known for being stable (always the same time complexity) and it is also in-place. When space is limited, heap sort may be a viable option to use.
* The more intuitive but space-heavy implementation involves inserting elements one by one into a heap, making necessary swaps along the way. Then, knowing that our `#extract` method returns the minimum element, we use it to extract elements one by one into another structure. Both `#insert` and `#extract` take `O(log n)` times, and since we use these methods for each of the `n` elements, the overall complexity is `O(n log n)`. The space complexity of this solution is linear because we are duplicating the elements multiple times.

* The in-place implementation takes the input array and looks at sections of it as a heap. We first look at slices of the array `(1, 2, ..., n)` from left to right and `#insert` elements as we expand the area we are looking at. We end up with a valid min heap. Next we again look at slices of the array but this time from `(n, n-1, ..., 2, 1)` and from right to left, and `#extract` elements as we move the divider. We end up with an array that is sorted from greatest to least, so we reverse the array (this could be avoided by using a max heap instead).
