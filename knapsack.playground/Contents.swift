// Knapsack problem

class Matrix {
    let rows: Int
    let columns: Int
    var value: [[Int]]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        value = Array(repeating: Array<Int>(repeating: 0, count: columns), count: rows)
    }
}

class Item {
    let value: Int
    let weight: Int
    init(value: Int,
         weight: Int) {
        self.value = value
        self.weight = weight
    }
}

func calculate(items: [Item], capacity: Int) -> Int {
    let numberOfItems = items.count
    var matrix = Matrix(rows: numberOfItems + 1, columns: capacity + 1).value

    for i in 0...(capacity - 1) {
        matrix[0][i] = 0
    }

    for i in 1...numberOfItems {
        for j in 0...capacity {
            if items[i - 1].weight > j { // The weight of the object is higher than the capacity of the column --> It fits?
                matrix[i][j] = matrix[i - 1][j] // It doens't fit -> Keep the current value
            } else {
                // It fits: Que valor ponemos?
                let itemWeight = items[i-1].weight
                let itemValue = items[i-1].value
                let currentValue = matrix[i-1][j]
                let valueWithoutTheWeightItemNeeds = matrix[i-1][j - itemWeight]
                matrix[i][j] = max(
                    currentValue, // Current value with other objects
                    valueWithoutTheWeightItemNeeds + itemValue // Max value with other object and space to add the new one
                )
            }
        }
    }
    return matrix[numberOfItems][capacity]
}

let item1 = Item(value: 1, weight: 1)
let item2 = Item(value: 2, weight: 1)
let item3 = Item(value: 3, weight: 2)
let items = [item1, item2, item3]
let a = calculate(items: items, capacity: 3)

let item4 = Item(value: 1, weight: 1)
let item5 = Item(value: 1, weight: 2)
let item6 = Item(value: 2, weight: 2)
let item7 = Item(value: 4, weight: 3)
let items2 = [item4, item5, item6, item7]
let b = calculate(items: items2, capacity: 5)
