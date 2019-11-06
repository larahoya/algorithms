// BUBBLE SORT

func bubbleSort(_ array: [Int]) -> [Int] {
    var mutableArray = array
    var shouldContinue = true
    while shouldContinue {
        shouldContinue = false
        for i in 1..<array.count {
            let first = mutableArray[i - 1]
            let second = mutableArray[i]
            if first > second {
                mutableArray[i] = first
                mutableArray[i-1] = second
                shouldContinue = true
            }
        }
    }
    return mutableArray
}

var a = [1, 44, 5, 61, 12, 4, 7, 90, 17, 56, 32, 25, 7, 9, 67, 45]
let resultA = bubbleSort(a)

func bubbleSortRW(_ array: [Int]) -> [Int] {
    var mutableArray = array
    for i in 0..<mutableArray.count {
        for j in 1..<mutableArray.count - i {
            let first = mutableArray[j-1]
            let second = mutableArray[j]
            if first > second {
                mutableArray[j] = first
                mutableArray[j-1] = second
            }
        }
    }
    return mutableArray
}

let resultB = bubbleSortRW(a)
