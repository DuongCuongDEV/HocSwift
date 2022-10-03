//
//  ViewController.swift
//  collectionViewInTableView
//
//  Created by Dương Văn Cường on 17/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! FoodTableViewCell
        
        cell.lblFoodName.text = "Bún chả chấm"
        cell.imgFood.image = UIImage(named: "image 13")
        
        return cell
    }
    

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "cellTable")
        // Do any additional setup after loading the view.
    }


}

