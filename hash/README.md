# Hash Map and LRU Cache

Set - data type storing unordered, unique items with `O(1)` lookup time

### Phase 1: Int Set
We implement a set for integers using an array. To reduce lookup time from `O(n)` to `O(1)` we set up buckets to place our integers - and then resize the buckets when the number of integers equals the number of buckets. On average, we can expect `O(1)` lookup time.

### Phase 2: Hashing
We develop a hash function that deterministically maps arrays, strings, and hashes. The XOR function is helpful here.

### Phase 3: Hash Set
We use our hashing function to improve our int set to store more types of data.

### Phase 4: Linked List
A doubly-linked list is a series of nodes where each node holds a pointer to the previous node and a pointer to the next node. Each node stores a key and a value.
* Lookup and search take `O(n)` time
* Insertion and deletion take `O(1)` time

### Phase 5: Hash Map
Instead of storing elements in an array of buckets, they are now stored in a linked list.

### Phase 6: LRU Cache
The Least Recently Used Cache is a storage of the n most recently-used items. When retrieving or inserting an item, that item is marked as most recently used. If an item is inserted when max capacity has been reached, the least recently used item is deleted.

The LRU Cache is implemented using the hash map and linked list. The linked list stores each cached object in a node, and they are inserted in order of use. Inserting and deleting take `O(1)` time, but lookup time remains `O(n)`. This problem is solved using the hash map to key into the nodes in the linked list. Insertion and deletion in the linked list will also update the hash map accordingly.

### Phase 7: Practical Problem
Using our hash map, we can take a string and be able to tell whether it is a palindrome from just one iteration through the string (`O(n)`).
