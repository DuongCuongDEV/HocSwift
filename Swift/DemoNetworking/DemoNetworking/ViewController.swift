//
//  ViewController.swift
//  DemoNetworking
//
//  Created by Dương Văn Cường on 22/09/2022.
//

import UIKit
import Alamofire
import Kingfisher


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var friends: Friends = []
    var foods: Foods = []
    var likeDictionary: [Int: Bool] = [:]

    @IBOutlet weak var clvFriends: UICollectionView!
    @IBOutlet weak var tblFriends: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.delegate = self
        tblFriends.dataSource = self
        tblFriends.register(UINib(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFriend")
        
        // Do any additional setup after loading the view.
        
        
        
      
        getFriendsFromAPI()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "cellFriend", for: indexPath) as! FriendTableViewCell
        

        
        var currentFriend = friends[indexPath.row]
        
        cell.lblName.text = currentFriend.name
        let imgFriend = URL(string: currentFriend.avatar)
        cell.imgAvatar.kf.setImage(with: imgFriend)
        cell.imgLike.tag = indexPath.row
        cell.imgLike.addTarget(self, action: #selector(likeAction(_:)), for: .touchUpInside)
        
        
        if let isCheckLike = likeDictionary[indexPath.row]{
            if isCheckLike {
                cell.imgLike.setImage(UIImage(named: "heart (6)"), for: .normal)
            }
        }
        
        
        return cell
    }
    
    

    @objc func likeAction(_ sender: UIButton){
        
        if let isButtonCheck = likeDictionary[sender.tag]{
            likeDictionary[sender.tag] = !isButtonCheck
        } else {
            likeDictionary[sender.tag] = true
        }
        tblFriends.reloadData()
        
        print("\(sender.tag) : \(likeDictionary[sender.tag])")
        print("\(sender.tag)")
        print("\(friends[sender.tag].name)")
        
        
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

