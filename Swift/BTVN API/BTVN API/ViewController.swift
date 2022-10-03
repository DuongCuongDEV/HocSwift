//
//  ViewController.swift
//  BTVN API
//
//  Created by ChâuNT on 27/09/2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblInfo: UITableView!
    
    var infos: Infos = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tblInfo.dataSource = self
        tblInfo.delegate = self
        tblInfo.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier:"InfoTableViewCell")
        getInfoFromAPI()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblInfo.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        let currentInfo = infos[indexPath.row]
        cell.lblName.text = infos [indexPath.row].name
        cell.lblId.text = infos [indexPath.row].id
//        cell.lblPhone.text = infos [indexPath.row].phone
        cell.lblSex.text = infos [indexPath.row].sex
        let avatarURL  = URL(string: currentInfo.avatar)
        cell.imgAvatar.kf.setImage(with: avatarURL)
        return cell
    }
    func getInfoFromAPI () {
        AF.request("https://632c7f1a1aabd837399d7808.mockapi.io/Info").responseDecodable (of: Infos.self) { responseData in
            if let infosData = responseData.value {
                self.infos = infosData
                self.tblInfo.reloadData()
            }
        }
    }
}
