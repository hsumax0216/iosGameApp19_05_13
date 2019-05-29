//
//  ViewController.swift
//  iosGameApp19_05_13
//
//  Created by VMwareMojave on 2019/5/10.
//  Copyright © 2019 hsumax0216. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func informationBtn(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "PXkemon!"
        content.subtitle = "demo Ver."
        content.body =  "快來體驗PXkemon的魅力！！！"
        content.badge = 1
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    @IBAction func unwindScoreViewController(segue:UIStoryboardSegue){
        
    }
}

