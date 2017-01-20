//
//  AppDelegate.swift
//  LocalNotifications
//
//  Created by Eugene Pavlov on 1/20/17.
//  Copyright © 2017 Eugene Pavlov. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 2.1 Assign UNUserNotificationCenter delegate to selfß
        UNUserNotificationCenter.current().delegate = self
        
        // 2.2 Configure categories for User Notifications
        configureUserNotifications()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // Function to configure user category
    // indentifier comes from info.plist
    private func configureUserNotifications() {
        
        // 3. CREATE ACTION BUTTONS FOR USER NOTIFICATION
        let favAction = UNNotificationAction(identifier: "fistBump", title: "👊 Fist Bump", options: [])
        let dissmissAction = UNNotificationAction(identifier: "dismiss", title: "🚫 Dissmiss", options: [])
        
        // Add category
        let category = UNNotificationCategory(identifier: "myNotificationCategory", actions: [favAction, dissmissAction], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
}

// 2. ADD APPDELEGATE EXTENSION TO ALLOW NOTIFICATIONS TO BE DISPLAYED IN APP FOREGROUND
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
    // 3.1 Implement function that takes care of notification actions buttons tap functionality
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // DO THE MAGIC HERE
        // But for now just print()
        print("Responce received for \(response.actionIdentifier)")
        completionHandler()
    }
}

