//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Eugene Pavlov on 1/20/17.
//  Copyright © 2017 Eugene Pavlov. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Request permission to notify user
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notifications access granted")
            } else {
                print(error?.localizedDescription ?? "No access to notifications granted")
            }
        }
        
    }

    @IBAction func notifyButtonTapped(_ sender: Any) {
        scheduleNotifications(inSeconds: 5) { (success) in
            if success {
                print("Notification successfuly scheduled!")
            } else {
                print("Error scheduling notification")
            }
        }
    }

    // 1.2 Function to schedule notification
    func scheduleNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        // 1.3 Create content for notification
        let notif = UNMutableNotificationContent()
        
        notif.title = "New notification"
        notif.subtitle = "Test project"
        notif.body = "Test of new notifications in iOS 10. All your base are belong to us."
        
        // 1.4 Add notification trigger
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        // 1.5 Add request for notification
        let request = UNNotificationRequest(identifier: "myNotifications", content: notif, trigger: notifTrigger)
        
        // 1.6 Add request to user notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error during sending notification")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

