//: [Previous](@previous)

import Foundation

func fibo(_ number: Int) -> Int {
    if number < 2 {
        return 1
    }
    return fibo(number - 1) + fibo(number - 2)
}
print(fibo(5))
