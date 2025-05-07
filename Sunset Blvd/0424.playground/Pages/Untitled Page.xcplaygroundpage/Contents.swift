import Foundation
func solution(_ prices: [Int]) -> [Int] {
    var answer = [Int]()
    var priceArray = prices
    for i in 0..<priceArray.count {
        var howlong = 1
        while true {
            if i + howlong < priceArray.count && priceArray[i] <= priceArray[i + howlong - 1] {
                howlong += 1
            }
            else {
                break
            }
        }
        answer.append(howlong-1)
    }
    
    return answer
}


print(solution([1,2,3,2,3]))
