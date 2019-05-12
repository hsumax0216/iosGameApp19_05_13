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
    var playerWin:Bool = true
    var playerPakemon:pakemon?
    var computerPakemon:pakemon?
    var SECOND:Int = 0
    var role: String?
    var comP: String?
    var timer:Timer?
    var monsters = [pakemon]()
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var computerSelectImage: UIImageView!
    @IBOutlet weak var playerSelectImage: UIImageView!
    @IBOutlet weak var attackValueLabel: UILabel!
    /*@objc func timeR(){
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
    }*/
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
            print(self.SECOND)
            if self.isJankened == true{
                self.timer?.invalidate()
                self.countdownLabel.font = UIFont.init(name: "Arial", size: 100)
                self.countdownLabel.text = ""
                self.SECOND = self.maxSec
                //self.isJankened = false
            }
            if self.SECOND < 0 && self.isJankened == false{
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
        computerAttackAnimated(point:35)
    }
    @IBAction func stoneBtnAction(_ sender: Any) {
        playerAttackAnimated(point:40)
    }
    @IBAction func scissorsBtnAction(_ sender: Any) {
    }
    func playerAttackAnimated(point:Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.9, delay: 0, animations: {
            self.attackValueLabel.textColor = UIColor(red:0 , green: 0,blue: 1,alpha: 1)
            self.attackValueLabel.text = "-" + String(point)
            self.playerSelectImage.center = CGPoint(x: 287.5,y: 234)
            self.computerSelectImage.backgroundColor = UIColor(red: 1,green: 0,blue: 0,alpha: 0.54)
        })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
            self.computerSelectImage.backgroundColor = UIColor(red: 255,green: 255,blue: 255,alpha: 0)
            self.playerSelectImage.center = CGPoint(x: 97.5,y: 396)
        })
    }
    func computerAttackAnimated(point:Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.9, delay: 0, animations: {
            self.attackValueLabel.textColor = UIColor(red:1 , green: 0,blue: 0,alpha: 1)
            self.attackValueLabel.text = "-" + String(point)
            self.computerSelectImage.center = CGPoint(x: 97.5,y: 396)
            self.playerSelectImage.backgroundColor = UIColor(red: 1,green: 0,blue: 0,alpha: 0.54)
        })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
            self.playerSelectImage.backgroundColor = UIColor(red: 255,green: 255,blue: 255,alpha: 0)
            self.computerSelectImage.center = CGPoint(x: 287.5,y: 234)
        })
        
    }
    func computejanken(playerValue:Int){
        var computerValue = Int.random(in:0...2)//janken sciccior == 0 stone == 1 paper == 2
        /*switch(computerValue){
            case 0:
                if playerValue == computerValue{
                    playerAttackAnimated(point:)
                    //我方攻擊藍色 敵方紅色
         
                    computerAttackAnimated(point:)
                }
                else if playerValue == 1 {
                    playerAttackAnimated(point:)
                    
                }
                else {
                    computerAttackAnimated(point:)
                    
                }
                break
            case 1:
                 if playerValue == computerValue{
                 playerAttackAnimated(point:)
                 //我方攻擊藍色 敵方紅色
         
                 computerAttackAnimated(point:)
                 }
                 else if playerValue == 2 {
                 playerAttackAnimated(point:)
         
                 }
                 else {
                 computerAttackAnimated(point:)
         
                 }
                break
            case 2:
                 if playerValue == computerValue{
                 playerAttackAnimated(point:)
                 //我方攻擊藍色 敵方紅色
         
                 computerAttackAnimated(point:)
                 }
                 else if playerValue == 0 {
                 playerAttackAnimated(point:)
         
                 }
                 else {
                 computerAttackAnimated(point:)
         
                 }
                break
            default:
                print("ERROR!")
                break
        }*/
        isJankened = false
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
