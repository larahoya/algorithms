// HEAP DATA STRUCTURE: MIN HEAP

struct MinHeap {

    static func create(with values: [Int]) -> MinHeap {
        var heap = MinHeap()
        values.forEach { heap.add($0) }
        return heap
    }

    var items: [Int] = []

    // PEEK:
    // Returns the value of the parent node in the Heap.
    // The Heap’s data is not modified.
    func peek() -> Int {
        if items.count != 0 {
            return items[0]
        } else {
            fatalError()
        }
    }

    // POLL:
    // Returns and removes the value of the parent node from the Heap.
    // Rearrange the values so that the next smallest (or largest) value becomes the parent node and all others fit in to the place they should.
    mutating func poll() -> Int {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }

    // ADD:
    // Appends a new value to the end of the Heap.
    // Then private functions are called which help determine where the new value should go in comparison with existing Heap values.
    mutating public func add(_ item: Int) {
        items.append(item)
        heapifyUp()
    }

    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }

            if items[index] < items[smallerChildIndex] {
                break
            } else {
                swap(indexOne: index, indexTwo: smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }

    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) > items[index] {
            swap(indexOne: getParentIndex(index), indexTwo: index)
            index = getParentIndex(index)
        }
    }

    mutating private func swap(indexOne: Int, indexTwo: Int) {
        (items[indexOne], items[indexTwo]) = (items[indexTwo], items[indexOne])
    }

    //Get Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }

    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }

    // Return Item From Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
}


// HEAP SORT

func heapSortMinHeap(_ array: [Int]) -> [Int] {
    var heap = MinHeap.create(with: array)
    var result = [Int]()
    for _ in 0..<array.count {
        result.append(heap.poll())
    }
    return result
}

var a = [1, 44, 5, 61, 12, 4, 7, 90, 17, 56, 32, 25, 7, 9, 67, 45]
let resultA = heapSortMinHeap(a)

// HEAP DATA STRUCTURE: MAX HEAP

struct MaxHeap {

    static func create(with array: [Int]) -> MaxHeap {
        var heap = MaxHeap()
        array.forEach { heap.add($0) }
        return heap
    }

    var items: [Int] = []

    mutating func poll() -> Int {
        let item = items.remove(at: 0)
        order()
        return item
    }

    mutating func add(_ item: Int) {
        items.append(item)
        order()
    }

    mutating private func order() {
        var index = items.count - 1
        while index > 0 {
            let parentIndex = getParentIndex(index: index)
            if items[index] > items[parentIndex] {
                swap(firstIndex: parentIndex, secondIndex: index)
            }
            index -= 1
        }
    }

    private func getParentIndex(index: Int) -> Int {
        return index/2
    }

    mutating private func swap(firstIndex: Int, secondIndex: Int) {
        (items[firstIndex], items[secondIndex]) = (items[secondIndex], items[firstIndex])
    }
}

func heapSortMaxHeap(_ array: [Int]) -> [Int] {
    var heap = MaxHeap.create(with: array)
    var result = [Int]()
    for _ in 0..<array.count {
        result.append(heap.poll())
    }
    return result
}

var resultB = heapSortMaxHeap(a)
resultB.reverse()
