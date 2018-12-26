# Static and Dynamic Arrays

Arrays in C are fixed in size (static) and thus a specific amount of memory is allocated for them. Arrays in Ruby can be modified in size (dynamic) by reallocating memory when the array's capacity is filled.

### Static Arrays
Because the location of the array in memory is already known, indexing is a matter of adding to the starting index position in memory. Pushing is similar, because the static array's length is recorded and the element can be placed at the end of the array. Deleting involves shifting over elements that come after the deleted element, so this runs in `O(n)` time.
* `#find` runs in `O(1)`
* `#push` runs in `O(1)`
* `#delete` runs in `O(n)`

### Dynamic Arrays
Indexing and deleting are the same in principle. But when we push to a dynamic array, the time complexity depends on whether the array has reached the end of its memory allocation. If it hasn't, the operation runs at `O(1)` as usual. But if it has, we must resize the array - all of the elements must be reallocated and this takes `O(n)`. But by looking at the amortized time complexity for each push, this comes down to `O(1)`.
* `#push` still runs in `O(1)` (amortized)

### Ring Buffer
In the dynamic array implemented, `#unshift` would run in `O(n)` because all elements would have to be shifted to the next position in memory. The ring buffer data structure is essentially a 'circular' array, with the starting index being recorded.

Now unshifting simply involves moving the starting index back by one position, and placing the element in that space.

Finding and pushing elements now needs the starting index and capacity.

### Queue with Max
By using our ring buffer structure, we can implement a queue that has a `max` API that runs in `O(1)`. The queue itself can be implemented by using the ring buffer to `O(1)` time for adding and removing elements.
* `#enqueue` runs in `O(1)`
* `#dequeue` runs in `O(1)`

To get `#max` to run in `O(1)`, we keep track of maximum values in a ring buffer. Because elements in a queue are removed in the order they enter, we know that an element can only be considered a max value for the elements that were added before it (and will thus be removed before it is removed).

Therefore, `#enqueue` keeps track of the relevant maximum values in order. `#max` will then return the first element in that record. `#dequeue` updates the maximum values if a maximum value is removed.
* `#max` runs in `O(1)`
