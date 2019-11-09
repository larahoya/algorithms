
// BELLMAN FORD

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
    Edge(from: S, to: E, value: -5),
    Edge(from: A, to: C, value: 6),
    Edge(from: B, to: A, value: 3),
    Edge(from: C, to: B, value: -2),
    Edge(from: D, to: C, value: 3),
    Edge(from: D, to: A, value: 10),
    Edge(from: E, to: D, value: 8)
]

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

let result = bellmanFord(vertices: vertices, graph: graph)
