//
//  TimelineTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/10/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 24.0/255.0, green: 70.0/255.0, blue: 148.0/255.0, alpha: 1.0)
        edgesForExtendedLayout = .None
        let nib: UINib = UINib(nibName: "TimelineTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "TimelineTableViewCell")
        
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let textColor = UIColor.whiteColor()
        let textFont = UIFont(name: "Avenir", size: 40.0)
        let titleTextAttributes: [String:NSObject] = [
            NSFontAttributeName: textFont!,
            NSForegroundColorAttributeName: textColor,
        ]
        self.navigationController!.navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait]
    }


    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 2
        default:
            return 1
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimelineTableViewCell", forIndexPath: indexPath) as! TimelineTableViewCell
        let event = cell.eventTitle
        let time = cell.eventTime
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                event.text = "Opening Ceremonies (Pauley Ballroom)"
                time.text = " 5:30pm-6:30pm"
            case 1:
                event.text = "First Committee Session"
                time.text = " 7:00pm-9:45pm"
            default:
                event.text = "Uh Oh"
                time.text = "Default"
            }
        case 1:
            switch(indexPath.row) {
            case 0:
                event.text = "Second Committee Session"
                time.text = " 9:00am-12:45pm"
            case 1:
                event.text = "Lunch"
                time.text = " 12:45pm-2:00pm"
            case 2:
                event.text = "Third Committee Session"
                time.text = " 2:00pm-5:00pm"
            case 3:
                event.text = "Delegate Dance (Pauley Ballroom)"
                time.text = " 7:30pm-10:30pm"
            default:
                event.text = "Uh Oh"
                time.text = "Default"
            }
        case 2:
            switch(indexPath.row) {
            case 0:
                event.text = "Fourth Committee Session"
                time.text = " 9:30am-12:30pm"
            case 1:
                event.text = "Closing Ceremonies (Pauley Ballroom)"
                time.text = " 2:00pm-3:30pm"
            default:
                event.text = "Uh Oh"
                time.text = "Default"
            }
        default:
            event.text = "Uh Oh"
            time.text = "Default"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String!
        switch(section) {
        case 0:
            title = "Friday, March 4"
        case 1:
            title = "Saturday, March 5"
        case 2:
            title = "Sunday, March 6"
        default:
            title = "Something's wrong"
        }
        return title
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView()
        headerView.frame = CGRectMake(0, 0, 320, 30)
        headerView.backgroundColor = UIColor.blackColor()
        
        let titleLabel = UILabel(frame: CGRectMake(5, 0, 320, 30))
        titleLabel.font = UIFont(name: "Thonburi", size: 18)
        titleLabel.textColor = UIColor.whiteColor()
        switch(section) {
        case 0:
            titleLabel.text = "Friday, March 4"
        case 1:
            titleLabel.text = "Saturday, March 5"
        case 2:
            titleLabel.text = "Sunday, March 6"
        default:
            titleLabel.text = "No"
        }
        headerView.addSubview(titleLabel)
        return headerView
    }

}
