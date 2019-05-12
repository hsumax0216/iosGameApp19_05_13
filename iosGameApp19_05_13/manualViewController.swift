//
//  manualViewController.swift
//  iosGameApp19_05_13
//
//  Created by VMwareMojave on 2019/5/11.
//  Copyright © 2019 hsumax0216. All rights reserved.
//

import UIKit
import SafariServices
class manualViewController: UIViewController, SFSafariViewControllerDelegate {
    @IBAction func WebBtn(_ sender: UIButton) {
        if let url = URL(string: "https://www.facebook.com/"){
            let controller = SFSafariViewController(url: url)
            controller.delegate = self
            present(controller,animated: true,completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
