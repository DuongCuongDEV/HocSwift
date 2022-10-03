//
//  FriendTableViewCell.swift
//  DemoNetworking
//
//  Created by Dương Văn Cường on 22/09/2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var imgLike: UIButton!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgLike.setImage(UIImage(named: "like (2)"), for: .normal)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        imgLike.setImage(UIImage(named: "like (2)"), for: .normal)
    }
    
}
