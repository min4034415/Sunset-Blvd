import Foundation

/*
 phone_book    return
 ["119", "97674223", "1195524421"]      false
 ["123","456","789"]                    true
 ["12","123","1235","567","88"]         false
 */
func solution(_ phoneBook: [String]) -> Bool {
    var answer: Bool = true
    var phoneBook = phoneBook.sorted()
//    var newPhoneBook = phoneBook.reduce("") {
//        $0+$1
//    }
//    var newPhoneBook = phoneBook.joined(separator: " ")
//    
//    if newPhoneBook.prefix(3)=="119" {return true}
    for i in 0..<phoneBook.count - 1 {
        if phoneBook[i+1].starts(with: phoneBook[i]) {
            return false
        }
    }
    
    return answer
}
print(solution(["119", "97674223", "1195524421"]))
