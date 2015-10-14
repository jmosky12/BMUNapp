//
//  DelegateGuideTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/11/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class DelegateGuideTableViewController: UITableViewController {
    
    let darkBlue = UIColor(red: 24.0, green: 70.0, blue: 148.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 253.0/255.0, green: 253.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let nib: UINib = UINib(nibName: "DelegateTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "DelegateTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String!
        switch(section) {
        case 0:
            title = "   Before Conference"
        case 1:
            title = "   During Conference"
        default:
            title = "Before Conference"
        }
        return title
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num: Int!
        switch(section) {
        case 0:
            num = 4
        case 1:
            num = 5
        default:
            num = 0
        }
        return num
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 253.0/255.0, green: 253.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DelegateTableViewCell", forIndexPath: indexPath) as! DelegateTableViewCell
        cell.selectionStyle = .None
        let title = cell.sectionLabel
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                title.text = "Research"
            case 1:
                title.text = "Position Paper"
            case 2:
                title.text = "Speech Preparation"
            case 3:
                title.text = "Packing"
            default:
                title.text = "Title"
            }
        case 1:
            switch(indexPath.row) {
            case 0:
                title.text = "Committee Fundamentals"
            case 1:
                title.text = "Committee Structure"
            case 2:
                title.text = "Speech Delivery"
            case 3:
                title.text = "Caucus"
            case 4:
                title.text = "Resolutions"
            default:
                title.text = "Title"
            }
        default:
            title.text = "Title"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let fileName: String!
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                fileName = "Research"
            case 1:
                fileName = "PositionPaper"
            case 2:
                fileName = "SpeechPreparation"
            case 3:
                fileName = "Packing"
            default:
                fileName = "Title"
            }
        case 1:
            switch(indexPath.row) {
            case 0:
                fileName = "CommitteeFundamentals"
            case 1:
                fileName = "CommitteeStructure"
            case 2:
                fileName = "SpeechDelivery"
            case 3:
                fileName = "Caucus"
            case 4:
                fileName = "Resolutions"
            default:
                fileName = "Title"
            }
        default:
            fileName = "Title"
        }
        let vc = WebViewController(file: fileName)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
