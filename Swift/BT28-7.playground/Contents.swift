import UIKit


//Bai3
struct Country{
    var name:String
    var number:[String]
}

var vietNam = Country(name: "VIETNAM", number: ["+84"])
var trungQuoc = Country(name: "TRUNGQUOC", number: ["+86"])
var anh = Country(name: "ANH", number: ["+44"])
var CzechRepublic = Country(name: "Czech Republic", number: ["+1787", "+1939"])

var contacts : [String:Country] = [:]
contacts["vn"] = vietNam
contacts["tq"] = trungQuoc
contacts["anh"] = anh
contacts["sec"] = CzechRepublic

func search(keyword: String) -> [Country]{
    var result : [Country] = []
    for (key, value) in contacts{
        if key == keyword{
            result.append(value)
        }
    }
    return result
}

print(search(keyword: "sec"))





//bai5
//func ReadNumber (number:Int) -> String{
//
//        var tram = (Int((number ?? <#default value#>)) ?? <#default value#>) / 100
//        var chuc = (Int((number ?? <#default value#>)) ?? <#default value#>) / 10
//        var donVi = (Int((number ?? <#default value#>)) ?? <#default value#>) % 10
//        var kq = ""
//
//    switch tram{
//            case 1: kq.append("một trăm ");break;
//            case 2: kq.append(" hai trăm ");break;
//            case 3: kq.append(" ba trăm ");break;
//            case 4: kq.append(" bốn trăm ");break;
//            case 5: kq.append(" năm trăm ");break;
//            case 6: kq.append(" sáu trăm ");break;
//            case 7: kq.append(" bảy trăm ");break;
//            case 8: kq.append(" tám trăm ");break;
//            case 9: kq.append(" chín trăm ");break;
//        default:
//            break
//    }
//    if chuc % 10 == 0 && donVi != 0 {
//        kq.append("lẻ ");
//    }
//
//    switch chuc{
//        case 1: kq.append("mười ");break;
//        case 2: kq.append(" hai mươi ");break;
//        case 3: kq.append(" ba mươi ");break;
//        case 4: kq.append(" bốn mươi ");break;
//        case 5: kq.append(" năm mươi ");break;
//        case 6: kq.append(" sáu mươi ");break;
//        case 7: kq.append(" bảy mươi ");break;
//        case 8: kq.append(" tám mươi ");break;
//        case 9: kq.append(" chín mươi ");break;
//        default:
//            break
//        }
//
//
//    switch(donVi){
//        case 1: kq.append("một ");break;
//        case 2: kq.append("hai ");break;
//        case 3: kq.append("ba ");break;
//        case 4: kq.append("bốn ");break;
//        case 5: kq.append("lăm ");break;
//        case 6: kq.append("sáu ");break;
//        case 7: kq.append("bảy ");break;
//        case 8: kq.append("tám ");break;
//        case 9: kq.append("chín ");break;
//        default:
//            break
//        }
//        return kq
//}
//print(ReadNumber(number: 966))





//bai4
//var time = ""
////let result = time.split(separator: ":")
////let myString = "556"
////let myInt = (myString as NSString).integerValue
////print(myInt)
////print(result)
//
//
//func ReadTime(time: String) -> String{
//    var time1 = ""
//    var numbers:[String] = []
//    for (index, a) in time.enumerated(){
//        if a != ":"{
//            time1.append(a)
//        } else {
//            numbers.append(time1)
//            time1 = ""
//        }
//        if index == time.count-1{
//            numbers.append(time1)
//        }
//    }
//    var time2 = ""
//    for (index,b) in numbers.enumerated(){
//       var nameee = ReadNumber(number: Int((b ?? <#default value#>)) ?? <#default value#>)
//        if index == numbers.startIndex{
//            time2.append(nameee)
//            time2.append("giờ")
//        } else {
//            time2.append(nameee)
//            time2.append("phút")
//        }
//    }
//    return time2
//}
//print(ReadTime(time: "12:35"))



//Bai ngan hang
struct Bank {
  var id: Int
  var name: String
  var code: String
}
 
struct Person {
  var id: Int
  var name: String
  var phone: String
}
 
struct ATM {
  var code: Int
  var address: String
  var bankID: Int
}
 
struct Card {
  var number: String
  var expireDate: String
  var bankID: Int
  var pin: Int
  var personID: Int
  var isActive: Bool
  var amount: Int
}
 
let bidv = Bank(id: 1, name: "Ngan hang thuong mai co phan quoc te BIDV", code: "BIDV")
let tech = Bank(id: 2, name: "Ngan hang Techcombank", code: "TECH")
 
 
let cayATM01 = ATM(code: 1, address: "10 Dich Vong Hau, Cau Giay, Ha Noi", bankID: 2)
 
let chuong = Person(id: 1, name: "Nguyen Kha Chuong", phone: "0374647306")
let cuong = Person(id: 2, name: "Duong van cuong", phone: "0823059750")
 
var theThu1Chuong = Card(number: "421495432123", expireDate: "12/22", bankID: 1, pin: 123456, personID: 1, isActive: true, amount: 5500000)
var theCuaCuong = Card(number: "9999999999", expireDate: "19/23", bankID: 1, pin: 99999, personID: 2, isActive: true, amount: 10000000)


var cards:[String : Card] = [:]
cards["421495432123"] = theThu1Chuong
cards["9999999999"] = theCuaCuong
 
func login(cardNumber: String, pin: Int) -> Bool {
    if cards["\(cardNumber)"]!.pin == pin{
        return true
    } else {
        return false
    }
}
print(login(cardNumber: "421495432123", pin: 123456))
//Kiem tra so du
func checkBalance(cardNumber: String, amountWithDraw: Int) -> Bool {
    if login(cardNumber: cardNumber, pin: cards["\(cardNumber)"]!.pin) == true {
        if amountWithDraw <= cards["\(cardNumber)"]!.amount{
            return true
        }
    }
    return false
}
 
print(checkBalance(cardNumber: "421495432123", amountWithDraw: 100000))


//Ham rut tien
func updateCardAmount(cardNumber: String, amount: Int) {
//    if checkBalance(cardNumber: cardNumber, amountWithDraw: amount) == true{
        var currentCard = cards["\(cardNumber)"]!
        currentCard.amount = currentCard.amount - amount
        cards.updateValue(currentCard, forKey: "\(cardNumber)")
//    } else {
//        return 0
//    }
//    return cards["\(cardNumber)"]!.amount
}
//withdraw(cardNumber: "421495432123", amount: 400000)
//print(cards)



//Ham chuyen tien
func transferMoney(cardNumber: String, amount: Int, receiverCardNumber: String){
    updateCardAmount(cardNumber: cardNumber, amount: amount)
    updateCardAmount(cardNumber: receiverCardNumber, amount: -amount)
}

transferMoney(cardNumber: "421495432123", amount: 800000, receiverCardNumber: "9999999999")
print(cards)









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


//bai1 bai cu
var names:[String] = ["Yen", "Oanh", "Cuong", "Huy", "Im", "Eu","Uyen"]
func bai1 (names:[String]) -> [String]{
    var names11:[String] = []
    for item in names{
        let item1 = item[item.startIndex].lowercased()
        if item1 == "u" || item1 == "e" || item1 == "o" || item1 == "a" || item1 == "i"{
            names11.append(item)
        }
    }
    return names11
}
print(bai1(names: names))


//bai 2 bai cu
var numbers:[Int] = [1,2,3,4,5,6,7,8,9]
func bai2 (numbers:[Int]) -> [Int]{
    var numbers1:[Int] = []
    for (index, _) in numbers.enumerated() {
        numbers1.append(numbers[(numbers.count - 1) - index])
        //number.count = 9 index = 0,1,.....
    
//        print((numbers.count - 1) - index)
    }
    return numbers1
}
print(bai2(numbers: numbers))



//bai3 bai cu
var zName = "Chuong"

func bai3 (zName:String) -> String{
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
    return zName3
}
print(bai3(zName: zName))




//bai5



//print(names4)

var namess3 = ["Chuong", "Tu", "Cuc", "Huy", "Khanh", "Yen", "Chau"]
func bai5 (namess3:[String]) -> [String]{
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
    return names4
}
print(bai5(namess3: namess3))
