//
//  ScoreViewController.swift
//  iosGameApp19_05_13
//
//  Created by t450sMAC on 2019/5/13.
//  Copyright © 2019 hsumax0216. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var score:Int?
    var life:Int?
    let nameSpace:String = ""
    @IBOutlet var scoreLbael: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score=score{
            if score < 0{
                scoreLbael.text = String(0)
            }
            else{
                scoreLbael.text = String(score)
            }
            
        }
        if let life=life,life > 0{
            print("Win")
        }
        else{
            print("lose")
        }
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
