import Cocoa

// 1. Generic Function Example
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

// Test the swap function
var num1 = 5
var num2 = 10
print("Before swap: num1 = \(num1), num2 = \(num2)")
swapValues(&num1, &num2)
print("After swap: num1 = \(num1), num2 = \(num2)")

// 2. Generic Type Example - Stack
struct Stack<Element> {
    private var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
    func peek() -> Element? {
        return items.last
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}

// Test the Stack
var stringStack = Stack<String>()
stringStack.push("First")
stringStack.push("Second")
print("Stack peek: \(stringStack.peek() ?? "Empty")")
print("Popped: \(stringStack.pop() ?? "Empty")")

// 3. Generic Type with Type Constraint
protocol Numeric {
    static func + (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
}

extension Int: Numeric {}
extension Double: Numeric {}

func sumAndMultiply<T: Numeric>(_ a: T, _ b: T) -> (sum: T, product: T) {
    return (a + b, a * b)
}

// Test numeric operations
let intResult = sumAndMultiply(5, 3)
print("Int result - Sum: \(intResult.sum), Product: \(intResult.product)")

let doubleResult = sumAndMultiply(3.5, 2.0)
print("Double result - Sum: \(doubleResult.sum), Product: \(doubleResult.product)")

// 4. Generic Type with Associated Type
protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(i: Int) -> Item { get }
}

struct IntArray: Container {
    private var items: [Int] = []
    
    var count: Int {
        return items.count
    }
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

// Test the Container
var intArray = IntArray()
intArray.append(1)
intArray.append(2)
print("Container count: \(intArray.count)")
print("First item: \(intArray[0])")

// 5. Generic Type with Multiple Type Parameters
struct Pair<First, Second> {
    let first: First
    let second: Second
    
    func swap() -> Pair<Second, First> {
        return Pair<Second, First>(first: second, second: first)
    }
}

// Test the Pair
let pair = Pair(first: "Hello", second: 42)
print("Original pair: \(pair.first), \(pair.second)")
let swappedPair = pair.swap()
print("Swapped pair: \(swappedPair.first), \(swappedPair.second)")
