//
//  InfoTableViewCell.swift
//  BTVN API
//
//  Created by ChâuNT on 27/09/2022.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    
    @IBOutlet weak var lblId: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var lblSex: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
