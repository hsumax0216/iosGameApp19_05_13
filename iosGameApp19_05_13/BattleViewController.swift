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
    var playerPakemon:pakemon!
    var computerPakemon:pakemon!
    var SECOND:Int = 0
    var playerNum:Int?
    var playerScore:Int = 0
    var compNum:Int?
    var role: String?
    var comP: String?
    var timer:Timer?
    var monsters = [pakemon]()
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var computerSelectImage: UIImageView!
    @IBOutlet weak var playerSelectImage: UIImageView!
    @IBOutlet weak var attackValueLabel: UILabel!
    @IBOutlet var computerLifeLabel: UILabel!
    @IBOutlet var playerLifeLabel: UILabel!
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
    func timerFunc(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: !self.isJankened){(_)in
            self.SECOND-=1
            self.countdownLabel.text = String(self.SECOND)
            print(self.SECOND,String(self.isJankened))
            if self.isJankened == true{
                print("in isJanken == true")
                self.timer?.invalidate()
                self.countdownLabel.font = UIFont.init(name: "Arial", size: 100)
                self.countdownLabel.text = ""
                self.SECOND = self.maxSec
                //self.isJankened = false
            }
            if self.SECOND < 0 && self.isJankened == false{
                print("in isJanken == false")
                //self.timer?.invalidate()
                self.countdownLabel.font = UIFont.init(name: "Arial", size: 35)
                let text = "Times up!"
                self.countdownLabel.text = text
                /*self.computerAttackActive()
                self.SECOND = self.maxSec
                self.countdownLabel.font = UIFont.init(name: "Arial", size: 100)
                self.countdownLabel.text = String(self.SECOND)*/
                self.isJankened = true
                self.computerAttackActive()
                self.SECOND = self.maxSec
                self.isJankened = false
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        monsters.append(fire)
        monsters.append(water)
        monsters.append(grass)
        monsters.append(dawae)
        if let role = role ,let comP=comP ,let playerNum=playerNum ,let compNum=compNum{
            playerSelectImage.image = UIImage(named: role)
            computerSelectImage.image = UIImage(named: comP)
            playerPakemon = monsters[playerNum]
            computerPakemon = monsters[compNum]
        }
        playerScore = 0
        playerLifeLabel.text = String(Int(playerPakemon.blood!))
        computerLifeLabel.text = String(Int(computerPakemon.blood!))
        SECOND = maxSec
        countdownLabel.font = UIFont.init(name: "Arial", size: 100)
        countdownLabel.text = String(SECOND)
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeR), userInfo: nil, repeats: true)
        timerFunc()
        // Do any additional setup after loading the view.
    }
    @IBAction func paperBtnAction(_ sender: Any) {
        isJankened = true
        computejanken(playerValue: 2)
    }
    @IBAction func stoneBtnAction(_ sender: Any) {
        isJankened = true
        computejanken(playerValue: 1)
    }
    @IBAction func scissorsBtnAction(_ sender: Any) {
        isJankened = true
        computejanken(playerValue: 0)
    }
    func playerAttackAnimated(point:Int){
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, animations: {
            self.attackValueLabel.textColor = UIColor(red:0 , green: 0,blue: 1,alpha: 1)
            print(point)
            if point < 100 {
                self.attackValueLabel.text = "-" + String(point)
            }
            else{
                self.attackValueLabel.text = "-∞"
            }
            self.playerSelectImage.center = CGPoint(x: 287.5,y: 234)
            self.computerSelectImage.backgroundColor = UIColor(red: 1,green: 0,blue: 0,alpha: 0.54)
        })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.9, delay: 0, animations: {
            self.computerSelectImage.backgroundColor = UIColor(red: 255,green: 255,blue: 255,alpha: 0)
            self.playerSelectImage.center = CGPoint(x: 97.5,y: 396)
        })
    }
    func computerAttackAnimated(point:Int){
        //var point = point
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, animations: {
            self.attackValueLabel.textColor = UIColor(red:1 , green: 0,blue: 0,alpha: 1)
            print(point)
            if point < 100 {
                self.attackValueLabel.text = "-" + String(point)
            }
            else{
                self.attackValueLabel.text = "-∞"
            }
            self.computerSelectImage.center = CGPoint(x: 97.5,y: 396)
            self.playerSelectImage.backgroundColor = UIColor(red: 1,green: 0,blue: 0,alpha: 0.54)
        })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.9, delay: 0, animations: {
            self.playerSelectImage.backgroundColor = UIColor(red: 255,green: 255,blue: 255,alpha: 0)
            self.computerSelectImage.center = CGPoint(x: 287.5,y: 234)
        })
        
    }
    func playerAttackActive(){
        let playerAttackV = playerPakemon.attack
        let computerDefend = computerPakemon.defend
        var demage:Int = 0
        demage = Int(playerAttackV! - computerDefend!)
        if demage < 0{
            demage = 0
        }
        playerScore += demage
        playerAttackAnimated(point: demage)
        computerPakemon.blood! -= Float(demage)
        computerLifeLabel.text = String(Int(computerPakemon.blood!))
    }
    func computerAttackActive(){
        let playerDefend = playerPakemon.defend
        let computerAttackV = computerPakemon.attack
        var demage:Int = 0
        demage = Int(computerAttackV! - playerDefend!)
        if demage < 0{
            demage = 0
        }
        playerScore -= demage
        computerAttackAnimated(point: demage)
        playerPakemon.blood! -= Float(demage)
        playerLifeLabel.text = String(Int(playerPakemon.blood!))
    }
    func computejanken(playerValue:Int){
        let computerValue = Int.random(in:0...2)//janken sciccior == 0 stone == 1 paper == 2
        switch(computerValue){
            case 0:
                if playerValue == computerValue{
                    //我方攻擊藍色 敵方紅色
                    playerAttackActive()
                    computerAttackActive()
                }
                else if playerValue == 1 {
                    playerAttackActive()
                }
                else {
                    computerAttackActive()
                }
                break
            case 1:
                if playerValue == computerValue{
                    //我方攻擊藍色 敵方紅色
                    playerAttackActive()
                    computerAttackActive()
                }
                 else if playerValue == 2 {
                    playerAttackActive()
                 }
                 else {
                    computerAttackActive()
                 }
                break
            case 2:
                if playerValue == computerValue{
                    //我方攻擊藍色 敵方紅色
                    playerAttackActive()
                    computerAttackActive()
                }
                 else if playerValue == 0 {
                    playerAttackActive()
                 }
                 else {
                    computerAttackActive()
                 }
                break
            default:
                print("ERROR!")
                break
        }
        isJankened = false
        if playerPakemon.blood! <= 0 || computerPakemon.blood! <= 0{
            isJankened = true
            let identif = "ScoreView"
            let controller = storyboard?.instantiateViewController(withIdentifier: identif) as? ScoreViewController
            controller?.score = playerScore
            controller?.life = Int(playerPakemon.blood!)
            navigationController?.pushViewController(controller!, animated: true)
        }
        SECOND=maxSec
        countdownLabel.font = UIFont.init(name: "Arial", size: 100)
        countdownLabel.text = String(SECOND)
        //timerFunc()
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
