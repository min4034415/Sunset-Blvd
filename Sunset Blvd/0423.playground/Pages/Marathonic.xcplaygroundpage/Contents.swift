import Foundation

let participant = ["mislav", "stefan", "mislav", "stefan"]
let completion = ["mislav", "stefan"]
solution(completion, participant)

func solution(_ participant:[String], _ completion: [String]) {
    var newparticipants = participant.sorted()
    var newCompletions = completion.sorted()
//    var people : [String] = []
//    for newparticiant in newparticipants{
//        for newCompletion in newCompletions {
//            if newparticiant == newCompletion {
//                people.append(newparticiant)
//            }
//        }
//    }
    
//    for i in 0..<newparticipants.count {
//        if newParticipants[i] != newCompletions[i] {
//
//        }
//    }
    var count = newparticipants.count
    var indexmap = [String:Int]()
    for newparticipant in newparticipants {
        if indexmap[newparticipant] == nil {
            indexmap[newparticipant] = 0
        }else {
            indexmap[newparticipant]! += 1
        }
    }
    for newCompletion in newCompletions {
        if indexmap[newCompletion]! > 0 {
            indexmap[newCompletion]! -= 1
            count -= 1
        }
    }
    print(indexmap.keys)
}
