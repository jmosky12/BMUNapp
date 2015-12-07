//
//  Tweet.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/31/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import Foundation

class Tweet: NSObject {
    
    let username: String!
    let text: String!
    let createdAt: NSDate?
    let profileImageURL: NSURL?
    let screenName: String!
    
    init?(dict: NSDictionary) {
        if let user = dict["user"] as? NSDictionary, txt = dict["text"] as? String, crt = dict["created_at"] as? String {
            text = txt
            createdAt = DateFormatterManager.sharedInstance.format(crt)
            if let name = user["name"] as? String, let imageURL = user["profile_image_url"] as? String, let sn = user["screen_name"] as? String {
                username = name
                screenName = sn
                profileImageURL = NSURL(string: imageURL)
            } else {
                username = nil
                screenName = nil
                profileImageURL = nil
            }
        } else {
            text = nil
            username = nil
            screenName = nil
            createdAt = nil
            profileImageURL = nil
        }
        
        super.init()
        
        if username.isEmpty { return nil }
        if text.isEmpty { return nil }
        if screenName.isEmpty { return nil }
    }
}
