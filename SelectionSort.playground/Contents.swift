// SELECTION SORT

func selectionSort(_ array: [Int]) -> [Int] {
    var mutableArray = array
    for i in 0..<array.count {
        let remainingArray = Array(mutableArray[i..<array.count])
        let minValue = remainingArray.min()!
        let minIndex = mutableArray.firstIndex(of: minValue)!
        (mutableArray[i], mutableArray[minIndex]) = (minValue, mutableArray[i])
    }
    return mutableArray
}

var a = [1, 44, 5, 61, 12, 4, 7, 90, 17, 56, 32, 25, 7, 9, 67, 45]
let resultA = selectionSort(a)
