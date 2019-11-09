
// DJIKSTRA
// O(nlogn)

struct Edge {
    let from: Vertice
    let to: Vertice
    let value: Int
}

struct Vertice: Hashable {
    let identifier: String
}

let S = Vertice(identifier: "S")
let A = Vertice(identifier: "A")
let B = Vertice(identifier: "B")
let C = Vertice(identifier: "C")
let D = Vertice(identifier: "D")
let E = Vertice(identifier: "E")

let vertices = [S, A, B, C, D, E]

let graph = [
    Edge(from: S, to: A, value: 4),
    Edge(from: S, to: E, value: 2),
    Edge(from: A, to: C, value: 6),
    Edge(from: B, to: A, value: 3),
    Edge(from: C, to: B, value: 1),
    Edge(from: D, to: C, value: 3),
    Edge(from: D, to: A, value: 3),
    Edge(from: E, to: D, value: 1),
    Edge(from: A, to: D, value: 3),
    Edge(from: E, to: D, value: 1),
    Edge(from: A, to: B, value: 5)
]

func djikstra(vertices: [Vertice], graph: [Edge]) -> [Vertice: Int?] {
    var memoTable: [Vertice: Int] = [S: 0]
    var visitedTable: [Vertice: Bool] = [S: true]
    var nextVertice: Vertice? = S
    while nextVertice != nil {
        visitedTable[nextVertice!] = true
        let outgoingEdges = graph.filter { $0.from == nextVertice! }
        for edge in outgoingEdges {
            let currentToValue = memoTable[edge.to] ?? 0
            if let currentFromValue = memoTable[edge.from], currentFromValue + edge.value < currentToValue || memoTable[edge.to] == nil {
                memoTable[edge.to] = currentFromValue + edge.value
            }
        }
        nextVertice = outgoingEdges
            .map { edge -> Vertice in return edge.to }
            .filter { vertice -> Bool in return visitedTable[vertice] == nil }
            .min { (first, second) -> Bool in return memoTable[first]! < memoTable[second]! }

    }
    return memoTable
}

func bellmanFord(vertices: [Vertice], graph: [Edge]) -> [Vertice: Int?] {
    var memoTable: [Vertice: Int] = [S: 0]
    var shouldContinue = true

    while shouldContinue {
        shouldContinue = false
        for vertice in vertices {
            let outgoingEdges = graph.filter { $0.from == vertice }
            for edge in outgoingEdges {
                let currentToValue = memoTable[edge.to] ?? 0
                if let currentFromValue = memoTable[edge.from], currentFromValue + edge.value < currentToValue || memoTable[edge.to] == nil {
                    memoTable[edge.to] = currentFromValue + edge.value
                    shouldContinue = true
                }
            }
        }
    }

    return memoTable
}

let resultDjikstra = djikstra(vertices: vertices, graph: graph)

// Validate is the shortest path
let resultBellmanFord = bellmanFord(vertices: vertices, graph: graph)
resultBellmanFord == resultDjikstra
