//
//  DateFormatterManager.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/31/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import Foundation

class DateFormatterManager: NSObject {
    
    static let sharedInstance = DateFormatterManager()
    
    let formatter = NSDateFormatter()
    let prettyFormatter = NSDateFormatter()
    
    override init() {
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        prettyFormatter.dateStyle = .ShortStyle
        prettyFormatter.timeStyle = .ShortStyle
        super.init()
    }
    
    func pretty(date: NSDate) -> String {
        return prettyFormatter.stringFromDate(date)
    }
    
    func format(s: String) -> NSDate? {
        return formatter.dateFromString(s)
    }
    
}