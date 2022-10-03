import Cocoa

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
let theThu1Van = Card(number: 4377347348438, expireDate: "09/22", bankID: 3, pin: 232232, personID: 3, isActive: true, amount: 55030000)
 
var


func login(cardNumber: Int, pinn: Int) -> Bool {
    
}
 
//Kiem tra so du
func checkBalance(cardNumber: Int, amountWithDraw: Int) -> Bool {
    if login(cardNumber: cardNumber, pinn: theThu1Chuong.pin) == true {
        if amountWithDraw <= theThu1Chuong.amount {
            return true
        } else {
            return false
        }
    }
    return false
}
 
//Ham rut tien
func withdraw(cardNumber: Int, amount: Int) -> Int {
    if checkBalance(cardNumber: cardNumber, amountWithDraw: amount) == true {
        let result = theThu1Chuong.amount - amount
        return result
    }
    return 0
}
print(withdraw(cardNumber: 421495432123, amount: 908340))


