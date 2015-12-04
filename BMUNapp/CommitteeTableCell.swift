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
    @IBOutlet weak var head: UILabel!
    @IBOutlet weak var headChair: UILabel!
    @IBOutlet weak var vice: UILabel!
    @IBOutlet weak var viceChairs: UILabel!
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var topicsButton: UIButton!
    //let initialHeight: CGFloat = 30
    //let expandedHeight: CGFloat = 250

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
    
    /*func checkHeight() {
        if frame.size.height < expandedHeight {
            head.hidden = true
            headChair.hidden = true
            vice.hidden = true
            viceChairs.hidden = true
            topic.hidden = true
            topicsButton.hidden = true
        }
    }
    
    func watchFrameChanges() {
        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        checkHeight()
    }
    
    func ignoreFrameChanges() {
        removeObserver(self, forKeyPath: "frame")
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }*/

}
