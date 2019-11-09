
// GRAPH TRAVERSAL: DEPTH FIRST SEARCH
// We want to go as deep as possible into the graph, traditionally from the left.
// The idea is to go as deep as you can and the backtrack your way back up and the over the right until the traversal of the tree is done

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

// STACK (LIFO)

struct Stack {
    var items: [BinaryNode] = []

    mutating func push(_ item: BinaryNode) {
        items.append(item)
    }

    func peek() -> BinaryNode {
        guard  !items.isEmpty else { fatalError() }
        return items[items.count - 1]
    }

    mutating func pop() -> BinaryNode {
        guard  !items.isEmpty else { fatalError() }
        return items.popLast()!
    }
}

func traverseGraph(root: BinaryNode) {
    var stack = Stack()
    stack.push(root)
    while stack.items.count > 0 {
        let currentNode = stack.pop()
        print("Current node: \(currentNode.value)")
        if let rightNode = currentNode.right {
            stack.push(rightNode)
        }
        if let leftNode = currentNode.left {
            stack.push(leftNode)
        }
    }
}

traverseGraph(root: rootNode)
// 0, 1, 3, 4, 2, 5, 6
