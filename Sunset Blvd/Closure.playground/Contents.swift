import Cocoa

var greeting = "Hello, playground"

// Basic closure examples
let numbers = [1, 2, 3, 4, 5]

// 1. Basic closure syntax
let doubled = numbers.map({ (number: Int) -> Int in
    return number * 2
})
print("Doubled numbers:", doubled)

// 2. Shorter closure syntax
let tripled = numbers.map { $0 * 3 }
print("Tripled numbers:", tripled)

// 3. Closure with multiple parameters
let sum = numbers.reduce(0) { $0 + $1 }
print("Sum of numbers:", sum)

// 4. Closure as a variable
let multiplyByTwo: (Int) -> Int = { number in
    return number * 2
}
print("Multiply 5 by 2:", multiplyByTwo(5))

// 5. Closure with capture list
var counter = 0
let incrementCounter = { [counter] in
    print("Current counter value:", counter)
}
incrementCounter()

// 6. Closure with completion handler
func performAsyncTask(completion: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        completion("Task completed!")
    }
}

performAsyncTask { result in
    print("Async result:", result)
}

// 7. Closure with multiple parameters and return type
let calculate: (Int, Int) -> Int = { (a, b) in
    return a * b + a + b
}
print("Calculate(3, 4):", calculate(3, 4))

// 8. Closure with optional return type
let findFirstEven: ([Int]) -> Int? = { numbers in
    return numbers.first { $0 % 2 == 0 }
}
print("First even number:", findFirstEven([1, 3, 4, 5]) ?? "None")
