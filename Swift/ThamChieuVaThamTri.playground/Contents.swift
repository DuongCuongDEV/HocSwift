import UIKit

//struct Book{
//    var id: String
//    var name: String
//}
//
//var math = Book(id: "1", name: "Toan")
//var literature = math
//literature.id = "2"
//
//print(literature.id)
//print(math.id)
//
//
//
//
//class Car{
//    var id: String = ""
//    var name: String = ""
//}
//
//let otoo = Car()
//otoo.id = "1"
//otoo.name = "Honda"
//
//var oto = otoo
//oto.id = "5"
//
////print(otoo.id)
////print(oto.id)
//
//
//
//
//class Motorbike: Car {
//    var nameCar: String = ""
//
//
//}
//
//var xeMay = Motorbike()
//xeMay.id = "9"
//xeMay.name = "Honda"
//xeMay.nameCar = "Dream"

//print(xeMay.nameCar)










class Subjects{
    var id: Int = 0
    var numberOfPages: Int = 0
    
    func learn(){
        print("So trang \(numberOfPages)")
    }
}

var subject = Subjects()
subject.id = 1
subject.numberOfPages = 50


class Math: Subjects{
    var calculation: String = ""
    
    override func learn(){
        print("Phep toan \(calculation). id = \(id)")
    }
}

var math = Math()
math.id = 2
math.numberOfPages = 90
math.calculation = "+"
math.learn()



class Literature: Subjects{
    var poem: String = ""
    
    override func learn() {
        print("Bai tho \(poem). id \(id)")
    }
}

var literature = Literature()
literature.id = 3
literature.numberOfPages = 150
literature.poem = "Tieu doi xe khong kinh"
literature.learn()


class Geography: Subjects{
    var map = ""
    override func learn() {
        print("Ban do \(map)")
    }
}

class Algebra: Math{
    var point: Int = 0
    override func learn() {
        print("Dai so cua mon toan co id = \(id) dat \(point)")
    }
}

var algebra = Algebra()
algebra.id = 5
algebra.numberOfPages = 40
algebra.calculation = "*"
algebra.point = 10
algebra.learn()
