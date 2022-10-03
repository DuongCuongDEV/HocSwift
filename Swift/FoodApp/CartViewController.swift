//
//  CartViewController.swift
//  FoodApp
//
//  Created by chuottp on 16/09/2022.
//

import UIKit
var itemList : [Food] = []
var costList : [CostCategoty] = []
class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewItemAddCart.dequeueReusableCell(withIdentifier: "ItemAddCartView", for: indexPath)
        
        let currentItem = itemList[indexPath.row]
        
        let imgPhoto = cell.viewWithTag(1) as! UIImageView
        imgPhoto.image = UIImage(named: "\(currentItem.img)")
        
        let lblTitle = cell.viewWithTag(2) as! UILabel
        lblTitle.text! = currentItem.name
        
        let lnlDescription = cell.viewWithTag(3) as! UILabel
        lnlDescription.text! = currentItem.information
        
        let lblPrice = cell.viewWithTag(4) as! UILabel
        lblPrice.text! = "$\(currentItem.price)"
        
        return cell
    }
    

    
    @IBOutlet weak var tblViewItemAddCart: UITableView!
    
    @IBOutlet weak var txtCode: UITextField!
    
    @IBOutlet weak var tblViewCostList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewItemAddCart.dataSource = self
        tblViewItemAddCart.delegate = self
        tblViewCostList.dataSource = self
        tblViewCostList.delegate = self
        initData()
        // Do any additional setup after loading the view.
        txtCode.layer.cornerRadius = 26
        txtCode.layer.borderWidth = 1
        txtCode.layer.borderColor = UIColor.gray.cgColor
    }
    
    func initData() {
        let firstItem = Food(name: "Red n hot pizza", price: 15.30, img: "Mask Group (14)", information: "Spicy chicken, beef", star: "")
        itemList.append(firstItem)
        
        let seconItem = Food(name: "Greek salad ", price: 12.00, img: "Mask Group (15)", information: "with baked salmon", star: "")
        itemList.append(seconItem)
        
        let subTotal = CostCategoty(title: "Subtotal", costSum: 27.30)
        costList.append(subTotal)
        
        let tax_Fees = CostCategoty(title: "Tax and Fees", costSum: 5.30)
        costList.append(tax_Fees)
        
        let delivery = CostCategoty(title: "Delivery", costSum: 1.00)
        costList.append(delivery)
        
        var result : Float = 0.0
        
        for cost in costList {
            result += cost.costSum
        }
        
        let total = CostCategoty(title: "Total", costSum: result)
        costList.append(total)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



struct CostCategoty {
    var title: String
    var costSum: Float
}
