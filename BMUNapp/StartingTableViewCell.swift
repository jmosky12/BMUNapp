//
//  StartingTableViewCell.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/25/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class StartingTableViewCell: UITableViewCell {

    @IBOutlet weak var bmunLogo: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.selectionStyle = .None
        
        let img = UIImage(named: "bmunlogo")
        bmunLogo.image = img
        bmunLogo.contentMode = UIViewContentMode.ScaleAspectFit
        bmunLogo.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
