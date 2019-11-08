
// BINARY SEARCH

func binarySearch(element: Int, list: [Int]) -> Int {
    let middleIndex = list.count/2
    let middleElement = list[middleIndex]
    if middleElement == element {
        return middleIndex
    } else if middleElement < element {
        let newArray = Array(list[middleIndex + 1..<list.count])
        guard newArray.count > 1 else { return middleIndex + 1 }
        return middleIndex + 1 + binarySearch(element: element, list: newArray)
    } else {
        let newArray = Array(list[0..<middleIndex])
        guard newArray.count > 1 else { return middleIndex - 1 }
        return binarySearch(element: element, list: newArray)
    }
}

let sortedArray = [1, 3, 10, 13, 16, 21, 28, 30, 41, 50, 61, 63, 70]

let resultA = binarySearch(element: 10, list: sortedArray)
let resultB = binarySearch(element: 70, list: sortedArray)
let resultC = binarySearch(element: 50, list: sortedArray)
