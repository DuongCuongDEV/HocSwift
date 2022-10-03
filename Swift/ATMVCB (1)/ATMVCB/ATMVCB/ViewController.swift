//
//  ViewController.swift
//  ATMVCB
//
//  Created by Thanh Dat on 19/08/2022.
//

import UIKit

var persons: [Person] = []
var banks: [Bank] = []
var atms: [ATM] = []
var cardDict: [String: Card] = [:]
var transactionsDict: [String: [Transaction]] = [:] //luu cac giao dich cua tung cardID


class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtLoginCardNumber: UITextField!
    
    @IBOutlet weak var txtLoginPIN: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var lblViewName: UILabel!
    
    @IBOutlet weak var lblViewMoney: UILabel!
    
    @IBOutlet weak var txtCardNumberReceive: UITextField!
    
    @IBOutlet weak var txtAmountOfMoney: UITextField!
    
    @IBOutlet weak var txtPinOfUser: UITextField!
    
    @IBOutlet weak var btnSendMoney: UIButton!
    
    @IBOutlet weak var btnWithdraw: UIButton!
    

    @IBOutlet weak var btnChangePin: UIButton!
    
    @IBOutlet weak var txtNewPin: UITextField!
    
    @IBOutlet weak var lblThongBao: UILabel!
    
    var currentATM = ATM()
    var currentCard = Card()
    			
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }

    
    @IBAction func btnTapLogin(_ sender: UIButton) {
        currentCard = currentATM.login(cardID: txtLoginCardNumber.text!, pin: Int(txtLoginPIN.text!)!)!
        if currentCard	 != nil {
            lblViewName.text = "Chủ thẻ: \(currentCard.getPersonInfo()!.fullName!)"
            lblViewName.backgroundColor = .green
            lblViewMoney.text = "Số dư: \(currentCard.amount!)"
            lblViewMoney.backgroundColor = .yellow
        }
    }

    @IBAction func btnTapSendMoney(_ sender: UIButton) {
        let transferAmount = Int(txtAmountOfMoney.text!)!
        let isCardCanTransfer = currentATM.isTransactionable(cardCheck: currentCard, withDrawAmount: transferAmount)
        if isCardCanTransfer {
            let isTransferSuccess = currentATM.transferMoney(senderCardID: currentCard.id!, receiverID: txtCardNumberReceive.text!, transferAmount: transferAmount)
            if isTransferSuccess {
                lblThongBao.text = "Chuyen tien thanh cong!"
                lblViewMoney.text = "Số dư: \(cardDict["\(currentCard.id!)"]!.amount!)"
                print("So du cua nguoi nhan: \(cardDict["\( txtCardNumberReceive.text!)"]!.amount!)")

            }
        }
    }
    
    
    @IBAction func btnTapWithdraw(_ sender: UIButton) {
        let withdrawaAmount = Int(txtAmountOfMoney.text!)!
        let isCardCanWithdraw = currentATM.isTransactionable(cardCheck: currentCard, withDrawAmount: withdrawaAmount)
        if isCardCanWithdraw {
            let isWithdrawSuccess = currentATM.withdraw(cardID: currentCard.id!, withdrawAmount: withdrawaAmount)
            if isWithdrawSuccess {
                lblThongBao.text = "Rut tien thanh cong!"
                lblViewMoney.text = "Số dư: \(cardDict["\(currentCard.id!)"]!.amount!)"
            }
        }
    }
    

    @IBAction func btnTapChangePin(_ sender: UIButton) {
        let changePin = txtNewPin.text!
        if changePin != "" {
            let isChangePin = currentCard.changePIN(newPIN: changePin)
            if isChangePin {
                lblThongBao.text = "Thay đổi mã pin thành công!!"
            } else {
                lblThongBao.text = "Thay đổi mã pin không thành công!!"
            }
        }
    }
    
    func initData() {
        let firstPerson = Person()
        firstPerson.id = "1"
        firstPerson.fullName = "Nguyen Kha Chuong"
        persons.append(firstPerson)
        
        let chuongCard = Card()
        chuongCard.id = "12345678"
        chuongCard.personID = "1"
        chuongCard.bankID = "1"
        chuongCard.amount = 5000000
        chuongCard.expiredDate = "12/2022"
        chuongCard.pin = 1234
        
        cardDict["12345678"] = chuongCard
        
        let yenCard = Card()
        yenCard.id = "09876543"
        yenCard.personID = "2"
        yenCard.bankID = "1"
        yenCard.amount = 100000
        yenCard.expiredDate = "01/2023"
        yenCard.pin = 1234
        
        cardDict["09876543"] = yenCard
        
        currentATM.id = "1"
        currentATM.bankID = "1"
        currentATM.address = "15 Dich Vong Hau, Ha Noi"
        currentATM.status = "Dang hoat dong"
    }
    
}

class Person {
    var id: String?
    var fullName: String?
}

class Bank {
    var id: String?
    var name: String?
}

class Card {
    var id: String?
    var bankID: String?
    var personID: String?
    var expiredDate: String?
    var amount: Int?
    var pin: Int?
    var status: String?
    
    func changePIN(newPIN: String) -> Bool {
        if newPIN != "" {
            for person in persons {
                if person.id == personID {
                    if Int(newPIN) != self.pin {
                        self.pin = Int(newPIN)!
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
        return false
    }
    
    func getPersonInfo() -> Person? {
        for person in persons {
            if person.id == personID {
                return person
            }
        }
        return nil
    }
}

class ATM {
    var id: String?
    var bankID: String?
    var address: String?
    var status: String?
    
    func login(cardID: String, pin: Int) -> Card? {
        for (key, value) in cardDict {
            if key == cardID && value.pin == pin {
                return value
            }
        }
        return nil
    }
    
    func isTransactionable(cardCheck: Card, withDrawAmount: Int) -> Bool {
        if cardCheck.amount! >= withDrawAmount {
            return true
        }
        return false
    }
    
    func createTransaction(aTransaction: Transaction) {
        if transactionsDict["\(aTransaction.cardID!)"] != nil {
            transactionsDict["\(aTransaction.cardID!)"]!.append(aTransaction)
        } else {
            transactionsDict["\(aTransaction.cardID!)"] = [aTransaction]
        }
    }
    
    func withdraw(cardID: String, withdrawAmount: Int) -> Bool {
        //1: tru tien trong the
        cardDict["\(cardID)"]!.amount = cardDict["\(cardID)"]!.amount! - withdrawAmount
        
        //2: tao 1 giao dich ghi nhan rut tien
        let withdrawTransaction = Transaction()
        withdrawTransaction.id = "1"
        withdrawTransaction.cardID = cardDict["\(cardID)"]!.id!
        withdrawTransaction.atmID = id
        withdrawTransaction.time = Date.now.description
        withdrawTransaction.action = "Withdraw"
        withdrawTransaction.amount = withdrawAmount
        withdrawTransaction.status = "Thanh cong"
        createTransaction(aTransaction: withdrawTransaction)
        return true
    }
    
    func transferMoney(senderCardID: String, receiverID: String, transferAmount: Int) -> Bool {
        //1: Tru tien trong the chuyen
        cardDict["\(senderCardID)"]!.amount = cardDict["\(senderCardID)"]!.amount! - transferAmount
        
        //2: Tang tien cho the nhan
        cardDict["\(receiverID)"]!.amount = cardDict["\(receiverID)"]!.amount! + transferAmount

        
        //3: Tao 1 giao dich ghi nhan tru tien cho the chuyen
        let decreaseTransaction = Transaction()
        decreaseTransaction.id = "2"
        decreaseTransaction.cardID = cardDict["\(senderCardID)"]!.id!
        decreaseTransaction.atmID = id
        decreaseTransaction.time = Date.now.description
        decreaseTransaction.action = "transfer"
        decreaseTransaction.amount = transferAmount
        decreaseTransaction.status = "Thanh cong"
        decreaseTransaction.receiverCardID = receiverID
        createTransaction(aTransaction: decreaseTransaction)
        
        //4; Tao 1 giao dich ghi nhan cong tien cho the nhan
        let increaseTransaction = Transaction()
        increaseTransaction.id = "3"
        increaseTransaction.cardID = cardDict["\(receiverID)"]!.id!
        increaseTransaction.atmID = id
        increaseTransaction.time = Date.now.description
        increaseTransaction.action = "receive"
        increaseTransaction.amount = transferAmount
        increaseTransaction.status = "Thanh cong"
        createTransaction(aTransaction: increaseTransaction)
        
        return true
    }
    
    
}

class Transaction {
    var id: String?
    var atmID: String?
    var cardID: String?
    var time: String?
    var action: String?
    var amount: Int?
    var receiverCardID: String?
    var status: String?
}

