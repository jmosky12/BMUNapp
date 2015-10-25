//
//  StartingTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/25/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class StartingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        
        let nib: UINib = UINib(nibName: "StartingTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "startingCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("startingCell", forIndexPath: indexPath) as! StartingTableViewCell
        var title = cell.titleLabel.text
        var details = cell.detailsLabel.text
        switch(indexPath.row) {
        case 0:
            title = "Delegate Guide"
            details = "Info to help you with MUN procedure"
        case 1:
            title = "Committees"
            details = "Details about this year's committees"
        case 2:
            title = "Checklist"
            details = "A checklist to keep you organized"
        case 3:
            title = "Live Updates"
            details = "Check here for important updates"
        case 4:
            title = "Timeline"
            details = "See what events are coming up"
        case 5:
            title = "Map"
            details = "See where you need to go"
        default:
            title = "Title"
            details = "Details"
        }
        return cell
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }


}
