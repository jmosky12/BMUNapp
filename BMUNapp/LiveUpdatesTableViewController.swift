//
//  LiveUpdatesViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/12/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class LiveUpdatesTableViewController: UIViewController, UITableViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet] = []
    var refreshControl: UIRefreshControl!
    
    init() {
        super.init(nibName: "LiveUpdatesTableViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        
        refreshControl = UIRefreshControl()
        tableView.insertSubview(refreshControl, atIndex: 0)
        refreshControl.addTarget(self, action: "getTweets:", forControlEvents: .ValueChanged)
        
        getTweets(nil)
        
        edgesForExtendedLayout = .None
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.preservesSuperviewLayoutMargins = false
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib: UINib = UINib(nibName: "LiveUpdatesTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "liveUpdates")
        
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

    
    func getTweets(sender: AnyObject!) {
        if sender != nil {
            refreshControl.beginRefreshing()
        }
        TwitterManager.sharedInstance.getTweets({ [weak self] (tweets: [Tweet]) -> () in
            self?.tweets = tweets
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
            }) { [weak self](error: NSError) -> () in
                self?.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("liveUpdates") as! LiveUpdatesTableViewCell
        let tweet = tweets[indexPath.row]
        
        cell.tweetText.text = tweet.text
        cell.date.text = tweet.createdAt?.shortTimeAgoSinceNow()
        cell.screenName.text = "@\(tweet.screenName)"
        cell.userName.text = tweet.username
        cell.avatar.image = UIImage(named: "twitterAvatar")
        
        return cell
    }
    
}
