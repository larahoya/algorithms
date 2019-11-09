
// GRAPH TRAVERSAL: BREADTH FIRST SEARCH
// We need to track the nodes in each level before traversing to the next level.

class BinaryNode {
    let value: Int
    var left: BinaryNode?
    var right: BinaryNode?

    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }

    func isLeaf() -> Bool {
        return left == nil && right == nil
    }
}

let rootNode = BinaryNode(value: 0)
rootNode.left = BinaryNode(value: 1)
rootNode.right = BinaryNode(value: 2)
rootNode.left?.left = BinaryNode(value: 3)
rootNode.left?.right = BinaryNode(value: 4)
rootNode.right?.left = BinaryNode(value: 5)
rootNode.right?.right = BinaryNode(value: 6)

// QUEUE (FIFO)

struct Queue {
    var items: [BinaryNode] = []

    mutating func enqueue(_ item: BinaryNode) {
        items.append(item)
    }

    mutating func dequeue() -> BinaryNode {
        guard  !items.isEmpty else { fatalError() }
        return items.removeFirst()
    }
}

func traverseGraph(root: BinaryNode) {
    var queue = Queue()
    queue.enqueue(root)
    while queue.items.count > 0 {
        let currentNode = queue.dequeue()
        print("Current node: \(currentNode.value)")
        if let leftNode = currentNode.left {
            queue.enqueue(leftNode)
        }
        if let rightNode = currentNode.right {
            queue.enqueue(rightNode)
        }
    }
}

traverseGraph(root: rootNode)
// 0, 1, 2, 3, 4, 5, 6
