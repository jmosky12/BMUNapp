//
//  ChecklistTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/9/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

protocol ChecklistTableViewControllerDelegate {
    func replaceCellData(data: NSMutableArray)
    func getCellData() -> NSMutableArray
}

class ChecklistTableViewController: UITableViewController, ChecklistTableViewControllerDelegate {
    
    var cellData: NSMutableArray = []
    var addButton: UIBarButtonItem!
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 140
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        
        self.tableView.allowsMultipleSelectionDuringEditing = false
        addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "goToSegue")
        self.navigationItem.rightBarButtonItem = addButton
        let nib: UINib = UINib(nibName: "ChecklistTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "ChecklistTableViewCell")
        if defaults.objectForKey("cellData") == nil {
            defaults.setObject(cellData, forKey: "cellData")
        }/* else {
            cellData = defaults.objectForKey("cellData") as! NSMutableArray
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistTableViewCell") as! ChecklistTableViewCell
        let cellTitle = cell.cellTitle
        let cellDetail = cell.cellDetail
        cellTitle.text = " \(cellData[indexPath.row][0])"
        cellDetail.text = "\(cellData[indexPath.row][1])"
        
        cell.selectionStyle = .None
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            cellData.removeObjectAtIndex(indexPath.row)
            defaults.setObject(cellData, forKey: "cellData")
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140.0
    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setObject(cellData, forKey: "cellData")
    }



    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "checklistToCreateTask" {
            let vc = segue.destinationViewController as! CreateTaskViewController
            vc.delegate = self
        }
    }
    
    func goToSegue() {
        performSegueWithIdentifier("checklistToCreateTask", sender: self)
    }
    
    //MARK: - Delegate

    
    func getCellData() -> NSMutableArray {
        return cellData
    }
    
    func replaceCellData(data: NSMutableArray) {
        cellData = data
        //defaults.setObject(cellData, forKey: "cellData")
        tableView.reloadData()
    }

}
