import Foundation

var greeting = "Hello, playground"

public class Box<T> {
    public var content: T
    public init(content: T) {
        self.content = content
    }
}
let intBox = Box(content: 123)     // Box<Int>
let stringBox = Box(content: "Hi") // Box<String>

print(intBox.content)
print(stringBox.content)
let boxes: [Box<Any>] = [
//    let boxes: [Box] = [
    Box(content: 123),
    Box(content: "Hi")
]

for box in boxes {
    print(box.content)
}


class Book {
    private var title: String
    
    func printTitle() {
        print(title)
    }
    init(
        title: String
    ) {
        self.title = title
    }
}
var hi = Book(title: "hi")
hi.printTitle()
