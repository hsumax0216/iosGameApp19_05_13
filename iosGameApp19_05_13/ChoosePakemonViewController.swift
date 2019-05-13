//
//  ChoosePakemonViewController.swift
//  iosGameApp19_05_13
//
//  Created by VMwareMojave on 2019/5/11.
//  Copyright © 2019 hsumax0216. All rights reserved.
//

import UIKit

class ChoosePakemonViewController: UIViewController {
    @IBOutlet var monsterBtns: [UIButton]!
    @IBOutlet weak var SecretCodeField: UITextField!
    let secretCode:String = "DA WAE"
    //var CODE:Bool = true
    var roles = ["character01", "character02", "character03","character04"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
       
        let destinationController = segue.destination as? BattleViewController
        let rAndom=Int.random(in:0...2)
        //let raNdom=Int.random(in:0...2)
        if let identifier = segue.identifier, let number = Int(identifier) {
            destinationController?.playerNum = number
            destinationController?.compNum = rAndom
            destinationController?.role = roles[number]
            destinationController?.comP = roles[rAndom]
            print("prepare SEGUE if")
        }/*
        else if CODE==false{
            destinationController?.role = roles[raNdom]
            destinationController?.comP = roles[rAndom]
            CODE=true
            print("prepare SEGUE else if")
        }*/
    }
    
    @IBAction func dawaeSecretButton(_ sender: Any) {
        if let code = SecretCodeField.text, secretCode == code{
            print("succeed")
            //CODE=true
        }
        else{
            let teXt="WRONG"
            SecretCodeField.text=teXt
            let controller = UIAlertController(title: "Wrong!", message: "pls input the right answer", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            /*let randomAction = UIAlertAction(title: "help select", style: .cancel, handler: nil)
            controller.addAction(randomAction)*/
            present(controller, animated: true, completion: nil)
            //CODE=false
            print("fail")
        }
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
