
// FIBONACCI 1

func calculateFibonacciAt(index: Int) -> Int {
    guard index > 1 else { return index }
    return calculateFibonacciAt(index: index - 1) + calculateFibonacciAt(index: index - 2)
}

func calculateFibonacciTo(number: Int) {
    for n in 0..<number {
        print(calculateFibonacciAt(index: n))
    }
}

calculateFibonacciTo(number: 10)

// FIBONACCI 2: with memoization

func calculateFibonacciCachingTo(number: Int) -> [Int] {
    var sequence: [Int] = []
    for n in 0..<number {
        if n <= 1 {
            sequence.append(n)
        } else {
            sequence.append( sequence[n-1] + sequence[n-2] )
        }
    }
    return sequence
}

calculateFibonacciCachingTo(number: 10)

// FIBONACCI 3: we only want the last number
// GREEDY ALGORITHM

func calculateFibonacciConstantSpace(number: Int) -> Int {
    var previousFib = [0, 1]
    var currentFib = 0
    for _ in 2..<number {
        currentFib = previousFib[0] + previousFib[1]
        (previousFib[0], previousFib[1]) = (previousFib[1], currentFib)
    }
    return currentFib
}

calculateFibonacciConstantSpace(number: 10)
