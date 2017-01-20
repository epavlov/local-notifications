//
//  NotificationViewController.swift
//  ExampleNotificationExtension
//
//  Created by Eugene Pavlov on 1/20/17.
//  Copyright © 2017 Eugene Pavlov. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func didReceive(_ notification: UNNotification) {
        guard let attachment = notification.request.content.attachments.first else {
            return
        }
        
        // Allow to opperate outside of app sandbox, in case if app is closed
        if attachment.url.startAccessingSecurityScopedResource() {
            let imageData = try? Data.init(contentsOf: attachment.url)
            if let image = imageData {
                bgImage.image = UIImage(data: image)
            }
        }
    }
    
    // 3.2 Add didReceive func with responce to handle UN actions
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        if response.actionIdentifier == "fistBump" {
            completion(.dismissAndForwardAction)
        } else if response.actionIdentifier == "dismiss" {
            completion(.dismissAndForwardAction)
        }
    }

}
