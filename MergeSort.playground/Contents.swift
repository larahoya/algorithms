// MERGE SORT

// IMPOSTERS HANDBOOK

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array}
    let middle = array.count/2
    let left = Array(array[0..<middle])
    let right = Array(array[middle..<array.count])
    return merge(left: mergeSort(left), right: mergeSort(right))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var mutableLeft = left
    var mutableRight = right
    var result: [Int] = []
    while(mutableLeft.count > 0 || mutableRight.count > 0) {
        if mutableLeft.count > 0 && mutableRight.count > 0 {
            if mutableLeft[0] < mutableRight[0] {
                result.append(mutableLeft.remove(at: 0))
            } else {
                result.append(mutableRight.remove(at: 0))
            }
        } else if mutableLeft.count > 0 {
            result.append(mutableLeft.remove(at: 0))
        } else {
            result.append(mutableRight.remove(at: 0))
        }
    }
    return result
}

var a = [1, 44, 5, 61, 12, 4, 7, 90, 17, 56, 32, 25, 7, 9, 67, 45]
let resultA = mergeSort(a)
