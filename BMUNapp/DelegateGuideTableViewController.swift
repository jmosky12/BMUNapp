//
//  DelegateGuideTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/11/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class DelegateGuideTableViewController: UITableViewController {
    
    let darkBlue = UIColor(red: 24.0/255.0, green: 70.0/255.0, blue: 148.0/255.0, alpha: 1.0)
    let textColor = UIColor.whiteColor()
    let textFont = UIFont(name: "Avenir", size: 40.0)
    
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
        
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        
        let titleTextAttributes: [String:NSObject] = [
            NSFontAttributeName: textFont!,
            NSForegroundColorAttributeName: textColor,
        ]
        
        self.navigationController!.navigationBar.titleTextAttributes = titleTextAttributes
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DelegateTableViewCell", forIndexPath: indexPath) as! DelegateTableViewCell
        cell.selectionStyle = .None
        let img = cell.backgroundImage
            switch(indexPath.row) {
            case 0:
                setImage(img, fileName: "berk2", text: "Research")
            case 1:
                setImage(img, fileName: "campanile2", text: "Position Papers")
            case 2:
                setImage(img, fileName: "goldengate2", text: "Speech Preparation")
            case 3:
                setImage(img, fileName: "sathergate2", text: "Packing")
            case 4:
                setImage(img, fileName: "campanilebay2", text: "Committee Fundamentals")
            case 5:
                setImage(img, fileName: "mun2", text: "Committee Structure")
            case 6:
                setImage(img, fileName: "coit", text: "Speech Delivery")
            case 7:
                setImage(img, fileName: "sf2", text: "Caucusing")
            case 8:
                setImage(img, fileName: "ladies", text: "Resolutions")
            default:
                setImage(img, fileName: "ladies", text: "Resolutions")
            }
        return cell
    }
    
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
    
    func textToImage(text: NSString, image: UIImage, point: CGPoint) -> UIImage {
        
        UIGraphicsBeginImageContext(image.size)
        let imgTextColor = UIColor.whiteColor()
        let imgTextFont = UIFont(name: "Avenir", size: 50.0)
        let style: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        style.alignment = NSTextAlignment.Center
        
        let textFontAttributes: [String:NSObject] = [
            NSFontAttributeName: imgTextFont!,
            NSForegroundColorAttributeName: imgTextColor,
            NSParagraphStyleAttributeName: style,
        ]
        
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.width))
        let rect = CGRectMake(point.x, point.y, image.size.width, image.size.height)
        
        text.drawInRect(rect, withAttributes: textFontAttributes)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage
    }
    
    func setImage(iv: UIImageView, fileName: String, text: NSString) {
        iv.image = UIImage(named: fileName)
        iv.image = textToImage(text, image: iv.image!, point: CGPoint(x: 0, y: 75))
        
    }
    
    /*override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let img: UIImage = UIImage(named: "startinglonglogo")!
            let imgView: UIImageView = UIImageView(image: img)
            imgView.frame = CGRectMake(10, 10, 320, 100)
            return imgView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }*/


}
