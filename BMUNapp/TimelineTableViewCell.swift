//
//  TimelineTableViewCell.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/12/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.selectionStyle = .None
    }

    
}
