//
//  DelegateTableViewCell.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/11/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class DelegateTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    var type: DelegateGuideTableViewController.DelegateCellType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.separatorInset = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        backgroundImage.clipsToBounds = true
        
        self.backgroundColor = UIColor.clearColor()
    }

    func bindData(imageName: String, text: String) {
        backgroundImage.image = UIImage(named: imageName)
        cellLabel.text = text
    }
    
    func bindData2(type: DelegateGuideTableViewController.DelegateCellType) {
        self.type = type
        backgroundImage.image = type.backgroundImage()
        cellLabel.text = type.rawValue
    }
    
}
