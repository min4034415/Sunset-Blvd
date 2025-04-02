//: [Previous](@previous)

import Foundation

func determineHigherValue<T: Comparable>(valueOne: T, valueTwo: T){
    let higherValue = valueOne > valueTwo ? valueOne : valueTwo
    print("\(higherValue) is the higher value")
}


//determineHigherValue(valueOne: 10, valueTwo: 20)
//determineHigherValue(valueOne: 10, valueTwo: 20)
determineHigherValue(valueOne: "Sean", valueTwo: "Swift")

determineHigherValue(valueOne: Date.now(), valueTwo: <#T##Comparable#>)
//: [Next](@next)
