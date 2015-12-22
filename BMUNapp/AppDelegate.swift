//
//  AppDelegate.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/9/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit
import CoreData
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("INbyDC9BcrJRZiBzuPT2p2oquTMZq9tuTiAqRNOf", clientKey: "FoOfryHoH7L6L6VMH0qltbZuAzE37D4e2PZDgoc3")
        
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        
        let textFont = UIFont(name: "Avenir", size: 13.0)
        let titleTextAttributes: [String:NSObject] = [
            NSFontAttributeName: textFont!
        ]
        
        let delegateGuide = DelegateGuideTableViewController()
        let delegateGuideNC = UINavigationController(rootViewController: delegateGuide)
        let item1 = UITabBarItem(title: "Guide", image: nil, tag: 1)
        item1.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        item1.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -12.0)
        delegateGuideNC.tabBarItem = item1
        delegateGuideNC.navigationBar.barTintColor = UIColor.blackColor()
        delegateGuideNC.navigationBar.translucent = false
        delegateGuideNC.navigationBar.topItem?.title = "Delegate Guide"

        
        let committees = CommitteesTableViewController()
        let committeesNC = UINavigationController(rootViewController: committees)
        let item2 = UITabBarItem(title: "Committees", image: nil, tag: 2)
        item2.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        item2.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -12.0)
        committeesNC.tabBarItem = item2
        committeesNC.navigationBar.barTintColor = UIColor.blackColor()
        committeesNC.navigationBar.translucent = false
        committeesNC.navigationBar.topItem?.title = "Committees"
        
        let liveUpdates = LiveUpdatesTableViewController()
        let liveUpdatesNC = UINavigationController(rootViewController: liveUpdates)
        let item3 = UITabBarItem(title: "Updates", image: nil, tag: 3)
        item3.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        item3.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -12.0)
        liveUpdatesNC.tabBarItem = item3
        liveUpdatesNC.navigationBar.barTintColor = UIColor.blackColor()
        liveUpdatesNC.navigationBar.translucent = false
        liveUpdatesNC.navigationBar.topItem?.title = "Live Updates"

        let questions = QuestionsViewController()
        let questionsNC = UINavigationController(rootViewController: questions)
        let item4 = UITabBarItem(title: "Questions", image: nil, tag: 4)
        item4.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        item4.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -12.0)
        questionsNC.tabBarItem = item4
        questionsNC.navigationBar.barTintColor = UIColor.blackColor()
        questionsNC.navigationBar.translucent = false
        questionsNC.navigationBar.topItem?.title = "Questions"
        
        let timeline = TimelineTableViewController()
        let timelineNC = UINavigationController(rootViewController: timeline)
        let item5 = UITabBarItem(title: "Timeline", image: nil, tag: 5)
        item5.setTitleTextAttributes(titleTextAttributes, forState: .Normal)
        item5.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -12.0)
        timelineNC.tabBarItem = item5
        timelineNC.navigationBar.barTintColor = UIColor.blackColor()
        timelineNC.navigationBar.translucent = false
        timelineNC.navigationBar.topItem?.title = "Timeline"
        
        let controllers = [delegateGuideNC, committeesNC, liveUpdatesNC, questionsNC, timelineNC]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        self.window?.addSubview(tabBarController.view)
        window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        UITabBar.appearance().tintColor = UIColor.blueColor()
        UITabBar.appearance().translucent = false
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.jmoskowitz.BMUNapp" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("BMUNapp", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

