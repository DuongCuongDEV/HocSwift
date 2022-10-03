import UIKit

class Person{
    var cccd: String = ""
    var name: String = ""
    var phoneNumber: Int = 0
    
    func login(phoneNumber: Int, password: String) -> Bool {
        if phoneNumber == 123 && password == "abc"{
            return true
        }
        return false
    }
    
    func UpdateMyProfile(id: String) -> String {
        
    }
}

//QuanLyHeTHong
class ManageSystem: Person{
    var idManageSystem: String = ""
    
}

var cuong = ManageSystem()
cuong.cccd = "983683838363"
cuong.name = "Duong van cuong"
cuong.phoneNumber = 0823059750
cuong.idManageSystem = "QLHT1"
print(cuong.phoneNumber)

//NhaPhanPhoi
class Supplier: Person{
    var idSupplier: String = ""
    
}

//NguoiBan
class Seller: Person{
    var idSeller: String = ""
    
}

//NguoiMua
class Buyer: Person{
    var idBuyer: String = ""
    
}

//ThuKho
class Stocker: Person{
    var idStocker: String = ""
    
}

//SanPham
class Product{
    var id: String = ""
    var amount: Int = 0
    var name: String = ""
    var price: String = ""
    var expiry: String = ""
}

//PhieuXuatHang
class DeliveryNote{
    var formCode: String = ""
    var dateCreated: String = ""
    var amount: String = ""
    var products: [Product] = []
}

//PhieuNhapHang
class ImportCoupon: DeliveryNote{
    var idSupplier: String = ""
}

//HoaDon
class Invoice{
    var invoiceNumber: String = ""
    var dateCreated: String = ""
    var products: [Product] = []
    var intoMoney: String = ""
    var tax: String = ""
}

//KhoHang
class Warehouse{
    var id: String = ""
    var name: String = ""
    var products: [Product] = []
    var address: String = ""
}
