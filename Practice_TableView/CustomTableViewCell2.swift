//
//  CustomTableViewCell2.swift
//  Practice_TableView
//
//  Created by iDev0 on 2020/07/05.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import UIKit

class CustomTableViewCell2: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    static let identifier = "Cell02"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell2", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
