//
//  ViewController.swift
//  CheckLike
//
//  Created by Dương Văn Cường on 28/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var tblFriends: UITableView!
    override func viewDidLoad() {
        tblFriends.dataSource = self
        tblFriends.delegate = self
        tblFriends.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    func getFriendsFromAPI(){
        AF.request("https://632c7f491aabd837399d7c73.mockapi.io/Friends", method: .get).response{
            responseData in
            debugPrint(responseData)
        }
        AF.request("https://632c7f491aabd837399d7c73.mockapi.io/Friends", method: .get).responseDecodable(of: Friends.self) {
            responsedata in
            if let friendsData = responsedata.value{
                self.friends = friendsData
                self.tblFriends.reloadData()
            }
        }
    }

}

