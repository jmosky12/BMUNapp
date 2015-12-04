//
//  TwitterManager.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/31/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import Foundation
import STTwitter

class TwitterManager: NSObject {
    
    static let sharedInstance = TwitterManager()
    private let twitter: STTwitterAPI
    
    override init() {
        let consumerKey = "BfBhtc3rO3lJHdo5ES7YhJVWe"
        let consumerSecret = "FEqiPVMcQDT9DIk5oSkho0MnBKPyStydN8nPX3Jbz5ZwfHR0v2"
        twitter = STTwitterAPI(appOnlyWithConsumerKey: consumerKey, consumerSecret: consumerSecret)
        super.init()
        
    }
    
    func authenticate(cb: () -> ()) {
        twitter.verifyCredentialsWithUserSuccessBlock({ (token: String!, userID: String!) -> Void in
            cb()
            }) { (error: NSError!) -> Void in
                print("here's the error: \(error)")
        }
    }
    
    //eventually add parameter to tell how many tweets to grab
    func getTweets(success: ([Tweet]) -> (), error: (NSError) -> ()) {
        wrapAuthenticate { [weak self] () -> () in
            self?.twitter.getUserTimelineWithScreenName("berkeleyMUN", successBlock: { (response: [AnyObject]!) -> Void in
                if let statuses = response as? [NSDictionary] {
                    success(statuses.map(Tweet.init).filter { $0 != nil }.map { $0! })
                } else {
                    success([])
                }
                }) { (err: NSError!) -> Void in
                    error(err)
            }
        }
    }
    
    private func wrapAuthenticate(cb: () -> ()) {
        if isAuthenticated() {
            cb()
        } else {
            authenticate(cb)
        }
    }
    
    func isAuthenticated() -> Bool {
        return twitter.bearerToken != nil
    }
    
}
