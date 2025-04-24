import Foundation

public class Bridge {
    var counter: Int
    var name : String
    var address : String
    
    init(
        counter: Int,
        name: String,
        address: String
    ) {
        self.counter = 0
        self.name = "nobody"
        self.address = "unknown"
    }
    
    func accross(_ name: String, _ address: String) {
        self.counter += 1
        self.address = address
        check()
    }
    
    func check() {
        if(name.first != address.first) {
            print("alert")
        }
    }
    
    func toString() -> String {
        return "\(name), \(address)"
    }
}
