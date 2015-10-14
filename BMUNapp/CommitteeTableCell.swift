//
//  CommitteeTableCell.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/10/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class CommitteeTableCell: UITableViewCell {
    
    @IBOutlet weak var committee: UILabel!
    @IBOutlet weak var headChair: UILabel!
    @IBOutlet weak var viceChairs: UILabel!
    @IBOutlet weak var topicsButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        committee.layer.cornerRadius = 7.0
        committee.clipsToBounds = true
        viceChairs.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        viceChairs.numberOfLines = 0
        topicsButton.layer.cornerRadius = 7.0
        topicsButton.clipsToBounds = true
        topicsButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
