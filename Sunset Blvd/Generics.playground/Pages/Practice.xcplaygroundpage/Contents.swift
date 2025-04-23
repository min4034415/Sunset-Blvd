//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// MARK: - AnimalFeed Protocol
// This protocol represents anything that can be used as animal feed.
protocol AnimalFeed {}

// MARK: - Animal Protocol
// This protocol describes an animal that can eat a specific type of feed and may have a habitat.
protocol Animal {
    associatedtype Feed: AnimalFeed // The type of food this animal eats
    associatedtype Habitat
    func eat(_ food: Feed)
}

// MARK: - Feed Types
// Hay and Carrot are types of AnimalFeed
struct Hay: AnimalFeed {
    static func grow() -> Alfafa {
        // Returns a new Alfafa crop
        return Alfafa()
    }
}

struct Carrot: AnimalFeed {}

// MARK: - Crop Type
// Alfafa can be harvested into Hay
struct Alfafa {
    func harvest() -> Hay {
        // Returns a new Hay bale
        return Hay()
    }
}

// MARK: - Animal Implementations
struct Cow: Animal {
    // Cow eats Hay
    func eat(_ food: Hay) {
        print("Cow is eating hay!")
    }
    typealias Feed = Hay
    typealias Habitat = String // Example: "Pasture"
}

struct Horse: Animal {
    // Horse eats Carrot
    func eat(_ food: Carrot) {
        print("Horse is eating a carrot!")
    }
    typealias Feed = Carrot
    typealias Habitat = String // Example: "Stable"
}

struct Chicken: Animal {
    // Chicken eats Hay (for simplicity)
    func eat(_ food: Hay) {
        print("Chicken is pecking at hay!")
    }
    typealias Feed = Hay
    typealias Habitat = String // Example: "Coop"
}

// MARK: - Farm
struct Farm {
    // Generic feed function for any Animal
    func feed<A: Animal>(_ animal: A, with food: A.Feed) {
        animal.eat(food)
    }
}

// MARK: - Visualization of Interactions
print("\n=== Animal, Feed, and Habitat Summary ===")
print("| Animal   | Feed   | Habitat  | Example |")
print("|----------|--------|----------|---------|")
print("| Cow      | Hay    | Pasture  | Cow().eat(Hay())     |")
print("| Horse    | Carrot | Stable   | Horse().eat(Carrot())|")
print("| Chicken  | Hay    | Coop     | Chicken().eat(Hay()) |")

print("\n=== Feeding Sequence ===")
let farm = Farm()
let cow = Cow()
let horse = Horse()
let chicken = Chicken()

print("\nFeeding the cow:")
farm.feed(cow, with: Hay())

print("\nFeeding the horse:")
farm.feed(horse, with: Carrot())

print("\nFeeding the chicken:")
farm.feed(chicken, with: Hay())

// You can add more interactions or even loops to simulate a day on the farm!
