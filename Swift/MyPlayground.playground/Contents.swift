import UIKit

var greeting = "Hello, playground"
class Employee {
    
    let idsv: Int, score: Int, idmon: Int
    
    init(idsv: Int, score: Int, idmon: Int) {
        self.idsv = idsv
        self.score = score
        self.idmon = idmon
    }

}



let employeeArray = [
    Employee(idsv: 1, score: 7, idmon: 1),
    Employee(idsv: 1, score: 8, idmon: 2),
    Employee(idsv: 1, score: 9, idmon: 3),
    
    Employee(idsv: 2, score: 7, idmon: 1),
    Employee(idsv: 2, score: 5, idmon: 2),
    Employee(idsv: 2, score: 6, idmon: 3)
]

for array in employeeArray {
    if array.idsv == 1{
        print(array.score)
    }
}
