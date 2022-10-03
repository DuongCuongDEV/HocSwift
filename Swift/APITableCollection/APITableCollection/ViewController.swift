//
//  ViewController.swift
//  APITableCollection
//
//  Created by Dương Văn Cường on 27/09/2022.
//

import UIKit
import Alamofire
import Kingfisher



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblFriends: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "friendCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        
        if indexPath.row % 2 != 0 {
            cell.lblGroupName.textColor = .blue
        } else {
            cell.lblGroupName.textColor = .orange
        }
        
        cell.lblGroupName.text = "Nhóm \(indexPath.row)"
        return cell
    }
}

