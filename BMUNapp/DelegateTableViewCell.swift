//
//  DelegateTableViewCell.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/11/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class DelegateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bmunLogo: UIImageView!
    @IBOutlet weak var sectionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        let img = UIImage(named: "bmunlogo")
        bmunLogo.image = img
        bmunLogo.contentMode = UIViewContentMode.ScaleAspectFit
        bmunLogo.clipsToBounds = true
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
