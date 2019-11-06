
// QUICKSORT

func quicksort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let pivot = array[array.count - 1]
    let less = array.filter { $0 < pivot }
    let greater = array.filter { $0 > pivot }
    let equal = array.filter { $0 == pivot }

    return quicksort(less) + equal + quicksort(greater)
}

var a = [1, 44, 5, 61, 12, 4, 7, 90, 17, 56, 32, 25, 7, 9, 67, 45]
let resultA = quicksort(a)

// QUICKSORT LOMUTO

func partitionLomuto(_ a: inout [Int], low: Int, high: Int) -> Int {
    let pivot = a[high]

    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }

    }

    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quicksortLomuto(_ a: inout [Int], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: p - 1)
        quicksortLomuto(&a, low: p + 1, high: high)
    }
}

var b = [14, 4, 8, 23]

quicksortLomuto(&b, low: 0, high: b.count - 1)
