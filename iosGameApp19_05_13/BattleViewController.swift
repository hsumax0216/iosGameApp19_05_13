//
//  BattleViewController.swift
//  iosGameApp19_05_13
//
//  Created by VMwareMojave on 2019/5/11.
//  Copyright © 2019 hsumax0216. All rights reserved.
//

import UIKit
class pakemon{
    var blood:Float?
    var attack:Float?
    var defend:Float?
    init(blood:Float,attack:Float,defend:Float) {
        self.attack = attack
        self.blood = blood
        self.defend = defend
    }
    init(){
        self.blood = 0
        self.attack = 0
        self.defend = 0
    }
}
class BattleViewController: UIViewController {
    let maxSec:Int=15
    let fire = pakemon.init(blood: 30, attack: 15, defend: 5)
    let water = pakemon.init(blood: 35, attack: 10, defend: 7)
    let grass = pakemon.init(blood: 40, attack: 12, defend: 2)
    let dawae = pakemon.init(blood: 1000, attack: 1000, defend: 1000)
    var isJankened:Bool = false
    var player:pakemon?
    var computer:pakemon?
    var SECOND:Int = 0
    var role: String?
    var comP: String?
    var timer:Timer?
    var monsters = [pakemon]()
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var computerSelectImage: UIImageView!
    @IBOutlet weak var playerSelectImage: UIImageView!
    @objc func timeR(){
        SECOND = SECOND - 1
        if(SECOND > 0){
            print(Int(SECOND))
            countdownLabel.text = String(SECOND)
        }
        else{
            countdownLabel.font = UIFont.init(name: "Arial", size: 35)
            let text = "Times up!"
            countdownLabel.text = text
            //print(countdownLabel.text)
            timer!.invalidate()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SECOND=maxSec
        monsters.append(fire)
        monsters.append(water)
        monsters.append(grass)
        monsters.append(dawae)
        if let role = role ,let comP=comP{
            playerSelectImage.image = UIImage(named: role)
            computerSelectImage.image = UIImage(named: comP)
        }
        countdownLabel.font = UIFont.init(name: "Arial", size: 100)
        countdownLabel.text = String(SECOND)
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeR), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(_)in
            self.SECOND-=1
            self.countdownLabel.text = String(self.SECOND)
            if self.isJankened == true{
                self.timer?.invalidate()
                self.countdownLabel.text = ""
                self.SECOND = self.maxSec
                self.isJankened = false
            }
            if self.SECOND <= 0{
                self.timer?.invalidate()
                self.countdownLabel.font = UIFont.init(name: "Arial", size: 35)
                let text = "Times up!"
                self.countdownLabel.text = text
            }
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func paperBtnAction(_ sender: Any) {
        isJankened = true
    }
    @IBAction func stoneBtnAction(_ sender: Any) {
    }
    @IBAction func scissorsBtnAction(_ sender: Any) {
    }
    func playerAttackAnimated(){
        
    }
    func computejanken(){
        
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
