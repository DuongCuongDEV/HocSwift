import UIKit
//
//var greeting = "Hello, playground"
//
var fName = "Nguyen Kha Chuong"

for char in fName.reversed(){
    print(char)
}

//let sName = String(fName.reversed())
//print(sName)

//var text = "Anh yeu em rat yeu em nhieu"
//
//print(text.replacingOccurrences(of:"yeu em", with: "💕"))
//
//var foods = ["Com", "Chao","mi", "Com", "Bun bo BObo BO hue", "Bo xao"]
//
//for (index,food) in foods.enumerated() {
//    print(index,food.replacingOccurrences(of: "Com", with: "🍚"))
//}
//
//for (index,food) in foods.enumerated() {
//    foods[index] = food.lowercased().replacingOccurrences(of: " bo ", with: " 🐮 ").replacingOccurrences(of: "com", with: "🍚")
//}
//print(foods)




//struct Contact {
//  var name : String
//  var mobile : Int
//  var work : String
//  var gmail : String
//  var address : String
//}
//
//var bo = Contact(name: "Duong Van Chin", mobile: 0397039568, work:"Lam nong", gmail:"Chin@gmail.com", address: "Viet Tien Viet Yen BG")
//
//var me = Contact(name: "Hoang Thi Quy", mobile: 0823059750, work:"Lam nong", gmail:"Quy@gmail.com", address: "Viet Tien Viet Yen BG")
//var bac = Contact(name: "Duong Quoc Lap", mobile: 0823059750, work:"Lam nong", gmail:"Quy@gmail.com", address: "Viet Tien Viet Yen BG")
//
//var Contacts:[Contact] = []
//Contacts.append(bo)
//Contacts.append(me)
//// print(Contacts)
//
//var Contactss: [String:Contact] = [:]
//Contactss["Duong Van Chin"] = bo
//Contactss["Hoang Thi Quy"] = me
//// print(Contactss)
//
//var Contactss1: [String:Contact] = ["b":bo, "m":me]
//// print(Contactss1)
//for (key, value) in Contactss1 {
//    if key == "m"{
//      print(value.name)
//    }
//}
//
//
//
//func search(keyword: String) -> [Contact]{
//  var result : [Contact] = []
//  for (key, valuee) in Contactss{
//    if key.contains(keyword){
//      result.append(valuee)
//
//    }
//  }
//  return result
//}

//print(search(keyword : "Chin"))


//Bai3
struct contact{
    var name:String
    var number:[String]
}

var vietNam = contact(name: "VIETNAM", number: ["+84"])
var trungQuoc = contact(name: "TRUNGQUOC", number: ["+86"])
var anh = contact(name: "ANH", number: ["+44"])

var contacts : [String:contact] = [:]
contacts["vn"] = vietNam
contacts["tq"] = trungQuoc
contacts["anh"] = anh

func search(keyword: String) -> [contact]{
    var result : [contact] = []
    for (key, value) in contacts{
        if key == keyword{
            result.append(value)
        }
    }
    return result
}

print(search(keyword: "tq"))



//bai4
var time = "12:31"
//let result = time.split(separator: ":")
//let myString = "556"
//let myInt = (myString as NSString).integerValue
//print(myInt)
//print(result)


func readTime(time: String) -> String{
    var timee = ""
    var mangChuoi:[String] = []
    for (index, a) in time.enumerated(){
        if a != ":"{
            timee.append(a)
        } else {
            mangChuoi.append(timee)
            timee = ""
        }
        if index == time.count-1{
            mangChuoi.append(timee)
        }
    }
    
    for b in mangChuoi{
        var chuc = (Int((b ?? <#default value#>)) ?? <#default value#>) / 10
        var donVi = (Int((b ?? <#default value#>)) ?? <#default value#>) % 10
        
            switch chuc{
                      case 1: print("mười ");break;
                      case 2: print("hai mươi ");break;
                      case 3: print("ba mươi ");break;
                      case 4: print("bốn mươi ");break;
                      case 5: print("năm mươi ");break;
                      case 6: print("sáu mươi ");break;
                default:
                    break
            }
        
        
        switch(donVi){
                  case 1: print("một ");break;
                  case 2: print("hai ");break;
                  case 3: print("ba ");break;
                  case 4: print("bốn ");break;
                  case 5: print("lăm ");break;
                  case 6: print("sáu ");break;
                  case 7: print("bảy ");break;
                  case 8: print("tám ");break;
                  case 9: print("chín ");break;
            default:
                break
        }
    }
        
    return time
}
print(readTime(time: time))

//bai6
var doan = "Hello"




//bai4 bai cu
var names1 = ["Chuong", "Cuc", "Khanh"]
var names2 = ["Tu", "Huy", "yen","cuong","bbbb"]
func bai4 (names1:[String] , names2:[String]) -> [String]{
    var names3:[String] = []
    for i in 1...names2.count{
        if i <= names1.count{
            names3.append(names1[i - 1])
        }
        names3.append(names2[i - 1])
    }
    return names3
}

print(bai4(names1: names1, names2: names2))







//bai4
//var names1 = ["Chuong", "Cuc", "Khanh"]
//var names2 = ["Tu", "Huy", "yen","cuong","bbbb"]
//var names3:[String] = []
//
//for i in 1...names2.count{
//    if i <= names1.count{
//        names3.append(names1[i - 1])
//    }
//    names3.append(names2[i - 1])
//}


//for item1 in names2.enumerated(){
//    names3.append(names2[names2.startIndex])
//    names2.removeFirst(1)
//    if names1.count > 0{
//            names3.append(names1[names1.startIndex])
//            names1.removeFirst(1)
//    }
//}
//print(names3)




//bai5
var namess3 = ["Chuong", "Tu", "Cuc", "Huy", "Khanh", "Yen", "Chau"]
var names4: [String] = []

for (index, _) in namess3.enumerated(){
    var love = ""
    if index % 2 == 0{
        if index == namess3.count - 1{
            love = "\(namess3[index]) 💕 no none"
        } else {
            love = ("\(namess3[index]) 💕 \(namess3[index + 1])")
        }
        names4.append(love)
    }
}
print(names4)



//bai 2
var numbers:[Int] = [1,2,3,4,5,6,7,8,9]
var numbers1:[Int] = []
for (index, _) in numbers.enumerated() {
    numbers1.append(numbers[(numbers.count - 1) - index])
    //number.count = 9 index = 0,1,.....

    print((numbers.count - 1) - index)
}
print(numbers1)



//bai1
var names:[String] = ["Yen", "Oanh", "Cuong", "Huy", "Im", "Eu","Uyen"]

var names11:[String] = []
for item in names{
    let item1 = item[item.startIndex].lowercased()
    if item1 == "u" || item1 == "e" || item1 == "o" || item1 == "a" || item1 == "i"{
        names11.append(item)
    }
}
print(names11)



//bai3
var zName = "Chuong"
var zName1 = ""
var zName2 = ""
var zName3 = ""

for i in 1...zName.count{
    if i % 2 == 0 {
        zName1.append(zName[zName.index(zName.startIndex, offsetBy: i-1)])

    } else {
        zName2.append(zName[zName.index(zName.startIndex, offsetBy: i-1)])
    }
}
for i in 1...zName2.count{
    if i <= zName2.count{
        zName3.append(zName1[zName1.index(zName1.startIndex, offsetBy: i-1)])
    }
    zName3.append(zName2[zName2.index(zName2.startIndex, offsetBy: i-1)])
}

print(zName3)










//struct danhBa {
//    var ten : String
//    var
//}


































//var someInts: [Int] = []
//print("someInts is of type [Int] with \(someInts.count) items.")
//// Prints "someInts is of type [Int] with 0 items."
//
//var threeDoubles = Array(repeating: 0.0, count: 3)
//// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
//print(threeDoubles)
//
//someInts.append(3)
//// someInts now contains 1 value of type Int
//someInts = []
//// someInts is now an empty array, but is still of type [Int]
//
//var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
//// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
//
//var sixDoubles = threeDoubles + anotherThreeDoubles
//// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
//print(sixDoubles)
//
//var shoppingList: [String] = ["Eggs", "Milk"]
//// shoppingList has been initialized with two initial items
//var shoppingList = ["Eggs", "Milk"]
//print("The shopping list contains \(shoppingList.count) items.")
//// Prints "The shopping list contains 2 items."
//if shoppingList.isEmpty {
//    print("The shopping list is empty.")
//} else {
//    print("The shopping list isn't empty.")
//}
//// Prints "The shopping list isn't empty."
//shoppingList.append("Flour")
//// shoppingList now contains 3 items, and someone is making pancakes
//shoppingList += ["Baking Powder"]
//// shoppingList now contains 4 items
//shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//// shoppingList now contains 7 items
//var firstItem = shoppingList[0]
//// firstItem is equal to "Eggs"
//shoppingList[0] = "Six eggs"
//// the first item in the list is now equal to "Six eggs" rather than "Eggs"
//shoppingList[4...6] = ["Bananas", "Apples"]
//// shoppingList now contains 6 items
//shoppingList.insert("Maple Syrup", at: 0)
//// shoppingList now contains 7 items
//// "Maple Syrup" is now the first item in the list
//let mapleSyrup = shoppingList.remove(at: 0)
//// the item that was at index 0 has just been removed
//// shoppingList now contains 6 items, and no Maple Syrup
//// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
//firstItem = shoppingList[0]
//// firstItem is now equal to "Six eggs"
//let apples = shoppingList.removeLast()
//// the last item in the array has just been removed
//// shoppingList now contains 5 items, and no apples
//// the apples constant is now equal to the removed "Apples" string
//for item in shoppingList {
//    print(item)
//}
//// Six eggs
//// Milk
//// Flour
//// Baking Powder
//// Bananas
//for (index, value) in shoppingList.enumerated() {
//    print("Item \(index + 1): \(value)")
//}
//// Item 1: Six eggs
//// Item 2: Milk
//// Item 3: Flour
//// Item 4: Baking Powder
//// Item 5: Bananas
//var letters = Set<Character>()
//print("letters is of type Set<Character> with \(letters.count) items.")
//// Prints "letters is of type Set<Character> with 0 items."
//letters.insert("a")
//// letters now contains 1 value of type Character
//letters = []
//// letters is now an empty set, but is still of type Set<Character>
//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//// favoriteGenres has been initialized with three initial items
//var favoriteGenress: Set = ["Rock", "Classical", "Hip hop"]
//print("I have \(favoriteGenres.count) favorite music genres.")
//// Prints "I have 3 favorite music genres."
//if favoriteGenres.isEmpty {
//    print("As far as music goes, I'm not picky.")
//} else {
//    print("I have particular music preferences.")
//}
//// Prints "I have particular music preferences."
//favoriteGenres.insert("Jazz")
//// favoriteGenres now contains 4 items
//if let removedGenre = favoriteGenres.remove("Rock") {
//    print("\(removedGenre)? I'm over it.")
//} else {
//    print("I never much cared for that.")
//}
//// Prints "Rock? I'm over it."
//if favoriteGenres.contains("Funk") {
//    print("I get up on the good foot.")
//} else {
//    print("It's too funky in here.")
//}
//// Prints "It's too funky in here."
//for genre in favoriteGenres {
//    print("\(genre)")
//}
//// Classical
//// Jazz
//// Hip hop
//
//let oddDigits: Set = [1, 3, 5, 7, 9]
//let evenDigits: Set = [0, 2, 4, 6, 8]
//let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//
//oddDigits.union(evenDigits).sorted()
//// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//oddDigits.intersection(evenDigits).sorted()
//// []
//oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
//// [1, 9]
//oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
//// [1, 2, 9]
//
//let houseAnimals: Set = ["🐶", "🐱"]
//let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
//let cityAnimals: Set = ["🐦", "🐭"]
//
//houseAnimals.isSubset(of: farmAnimals)
//// true
//farmAnimals.isSuperset(of: houseAnimals)
//// true
//farmAnimals.isDisjoint(with: cityAnimals)
//// true
//
//var namesOfIntegers: [Int: String] = [:]
//// namesOfIntegers is an empty [Int: String] dictionary
//
//namesOfIntegers[16] = "sixteen"
//// namesOfIntegers now contains 1 key-value pair
//namesOfIntegers = [:]
//// namesOfIntegers is once again an empty dictionary of type [Int: String]
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//var airportss = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//
//print("The airports dictionary contains \(airports.count) items.")
//// Prints "The airports dictionary contains 2 items."
//if airports.isEmpty {
//    print("The airports dictionary is empty.")
//} else {
//    print("The airports dictionary isn't empty.")
//}
//// Prints "The airports dictionary isn't empty."
//
//airports["LHR"] = "London"
//// the airports dictionary now contains 3 items
//airports["LHR"] = "London Heathrow"
//// the value for "LHR" has been changed to "London Heathrow"
//
//if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
//    print("The old value for DUB was \(oldValue).")
//}
//// Prints "The old value for DUB was Dublin."
//if let airportName = airports["DUB"] {
//    print("The name of the airport is \(airportName).")
//} else {
//    print("That airport isn't in the airports dictionary.")
//}
//// Prints "The name of the airport is Dublin Airport."
//
//airports["APL"] = "Apple International"
//// "Apple International" isn't the real airport for APL, so delete it
//airports["APL"] = nil
//// APL has now been removed from the dictionary
//if let removedValue = airports.removeValue(forKey: "DUB") {
//    print("The removed airport's name is \(removedValue).")
//} else {
//    print("The airports dictionary doesn't contain a value for DUB.")
//}
//// Prints "The removed airport's name is Dublin Airport."
