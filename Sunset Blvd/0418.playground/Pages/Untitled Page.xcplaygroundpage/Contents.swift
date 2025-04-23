import Cocoa

var greeting = "Hello, playground"
var homie: [Character] = []
for i in greeting {
    homie.append(i)
}
print(homie)
homie.append("(")
print (homie)
print(homie.last ?? "NA")
var hiya = [1,3,5,6,7,8]
var sum = hiya.reduce(0){$0 + $1}

print(sum)
