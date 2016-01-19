//
//  DelegateGuideTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/11/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class DelegateGuideTableViewController: UITableViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        edgesForExtendedLayout = .None
        let nib: UINib = UINib(nibName: "DelegateTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "DelegateTableViewCell")
        
        // Ensures table cell separators are set up correctly
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        
        // Sets characteristics for top bar text
        let textColor = UIColor.whiteColor()
        let textFont = UIFont(name: "Avenir", size: 35.0)
        let titleTextAttributes: [String:NSObject] = [
            NSFontAttributeName: textFont!,
            NSForegroundColorAttributeName: textColor,
        ]
        
        self.navigationController!.navigationBar.titleTextAttributes = titleTextAttributes
        
    }
    
    // These two functions below prevent landscape mode
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait]
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    // Makes it easier to differentiate & access properties of each delegate guide section & its info
    enum DelegateCellType: String {
        case Research = "Research"
        case Papers = "Position Papers"
        case SpeechPrep = "Speech Preparation"
        case Packing = "Packing"
        case Fundamentals = "Committee Fundamentals"
        case Structure = "Committee Structure"
        case SpeechDelivery = "Speech Delivery"
        case Caucusing = "Caucusing"
        case Resolutions = "Resolutions"
        
        func backgroundImage() -> UIImage? {
            switch self {
            case .Research:
                return UIImage(named: "campanile2")
            case .Papers:
                return UIImage(named: "berk2")
            case .SpeechPrep:
                return UIImage(named: "goldengate2")
            case .Packing:
                return UIImage(named: "sathergate2")
            case .Fundamentals:
                return UIImage(named: "campanilebay2")
            case .Structure:
                return UIImage(named: "mun2")
            case .SpeechDelivery:
                return UIImage(named: "coit")
            case .Caucusing:
                return UIImage(named: "sf2")
            case .Resolutions:
                return UIImage(named: "ladies")
            }
        }
    
    }

    // Sets the properties of the cell at each index using the bindData method from DelegateTableViewCell.swift and the enum above
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DelegateTableViewCell", forIndexPath: indexPath) as! DelegateTableViewCell
        switch(indexPath.row) {
        case 0:
            cell.bindData(.Research)
        case 1:
            cell.bindData(.Papers)
        case 2:
            cell.bindData(.SpeechPrep)
        case 3:
            cell.bindData(.Packing)
        case 4:
            cell.bindData(.Fundamentals)
        case 5:
            cell.bindData(.Structure)
        case 6:
            cell.bindData(.SpeechDelivery)
        case 7:
            cell.bindData(.Caucusing)
        case 8:
            cell.bindData(.Resolutions)
        default:
            cell.bindData(.Resolutions)
        }
        return cell
    }

    // Prepares to load the PDF using the WebViewController.swift for the specific cell
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let fileName: String!
            switch(indexPath.row) {
            case 0:
                fileName = "Research"
            case 1:
                fileName = "PositionPaper"
            case 2:
                fileName = "SpeechPreparation"
            case 3:
                fileName = "Packing"
            case 4:
                fileName = "CommitteeFundamentals"
            case 5:
                fileName = "CommitteeStructure"
            case 6:
                fileName = "SpeechDelivery"
            case 7:
                fileName = "Caucus"
            case 8:
                fileName = "Resolutions"
            default:
                fileName = "Title"
            }
        let vc = WebViewController(file: fileName)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 152.0
    }

}
