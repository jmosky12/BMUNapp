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
    @IBOutlet weak var eventDetails: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventTitle.clipsToBounds = true
        eventTitle.layer.cornerRadius = 7.0
        eventDetails.editable = false
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
