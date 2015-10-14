//
//  TimelineTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/10/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib: UINib = UINib(nibName: "TimelineTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "TimelineTableViewCell")
        
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.rowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimelineTableViewCell", forIndexPath: indexPath) as! TimelineTableViewCell
        cell.selectionStyle = .None
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200.0
    }
    

}
