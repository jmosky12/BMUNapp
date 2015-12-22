//
//  CommitteeTableViewCell.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 12/8/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class CommitteeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var committeeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.selectionStyle = .None
    }
    
}
