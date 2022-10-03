import Cocoa
import Foundation

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
let vcb = Bank(id: 3, name: "Ngan hang VietComBank", code: "VCB")
 
 
let cayATM01 = ATM(code: 1, address: "10 Dich Vong Hau, Cau Giay, Ha Noi", bankID: 2)
let cayATM02 = ATM(code: 2, address: "18 Dich Vong, Cau Giay, Ha Noi", bankID: 1)
let cayATM03 = ATM(code: 3, address: "23 Dich Vong, Cau Giay, Ha Noi", bankID: 3)
 
let chuong = Person(id: 1, name: "Nguyen Kha Chuong", phone: "0374647306")
let Khanh = Person(id: 2, name: "Nguyen Van Khanh", phone: "0329923923")
let Van = Person(id: 3, name: "Nguyen Van Van", phone: "0388378332")
 
let theThu1Chuong = Card(number: "421495432123", expireDate: "12/22", bankID: 1, pin: 123456, personID: 1, isActive: true, amount: 5500000)
let theThu1Khanh = Card(number: "42144333432123", expireDate: "11/22", bankID: 2, pin: 82883, personID: 2, isActive: true, amount: 5788000)
let theThu1Van = Card(number: "4377347348438", expireDate: "09/22", bankID: 3, pin: 232232, personID: 3, isActive: true, amount: 55030000)
 
var cardDictionaries: [String: Card] = [:]
cardDictionaries["421495432123"] = theThu1Chuong
cardDictionaries["42144333432123"] = theThu1Khanh
cardDictionaries["4377347348438"] = theThu1Van



func login(cardNumber: Int, pin: Int) -> Bool {
    if cardDictionaries["\(cardNumber)"]!.pin == pin {
        return true
    }
    return false
}
 
//Kiem tra so du
func checkBalance(cardNumber: Int, amountWithDraw: Int) -> Bool {
    if cardDictionaries["\(amountWithDraw)"]!.amount >= amountWithDraw {
        return true
    }
    return false
}
 
//Ham rut tien
func updateCardAmount(cardNumber: String, amount: Int) {
    var currentCard = cardDictionaries["\(cardNumber)"]!
    currentCard.amount = currentCard.amount - amount
    cardDictionaries.updateValue(currentCard, forKey: "\(cardNumber)")
}
updateCardAmount(cardNumber: "42144333432123", amount: 300000)
print(cardDictionaries["42144333432123"])

//ham chuyen tien
func trasfer(cardNumber: String, amount: Int, receiverCardNumber: String) {
    var currentCard = cardDictionaries["\(cardNumber)"]! //ng chuyen
    currentCard.amount = currentCard.amount - amount
    cardDictionaries.updateValue(currentCard, forKey: "\(cardNumber)") //tru tien

    var receiverCard = cardDictionaries["\(receiverCardNumber)"]! //ng nhan
    receiverCard.amount = receiverCard.amount + amount
    cardDictionaries.updateValue(receiverCard, forKey: "\(receiverCardNumber)")
}  //code dai

func transfer(cardNumber: String, amount: Int, receiverCardNumber: String) {
    updateCardAmount(cardNumber: cardNumber, amount: amount)
    updateCardAmount(cardNumber: receiverCardNumber, amount: -amount)
}


transfer(cardNumber: "42144333432123", amount: 300000, receiverCardNumber: "4377347348438")
print(cardDictionaries)



