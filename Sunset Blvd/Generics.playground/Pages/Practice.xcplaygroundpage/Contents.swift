//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol Animal {
    associatedtype Feed: AnimalFeed
    associatedtype Habitat
    func eat(_ food: Feed)
}

struct Cow: Animal {
    func eat(_ food: Hay) {
        
    }
}

struct Horse: Animal {
    func eat(_ food: Carrot) {
        print("Moo")
    }
}

struct Chicken: Animal  {
    func eat(_ food: Any) {
        print("Moo")
    }
}

struct Hay {
    static func grow() -> Alfafa {
        
    }
}

struct Alfafa {
    func harvest() -> Hay {
        
    }
}

struct Farm {
//    func feed<A>(_ animal: A) where A: Animal {
//        func feed<A>(_ animal: A) {
//
//    }
    func feed(_ animal: some Animal) {
        
    }
}
