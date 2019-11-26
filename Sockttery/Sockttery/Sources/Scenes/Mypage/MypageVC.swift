//
//  MypageVC.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/27.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class MypageVC: UIViewController {

    @IBOutlet var userId: UILabel!
    @IBOutlet var chargeText: UILabel!
    @IBOutlet var rechargeBtn: UIButton!
    @IBOutlet var withdrawBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rechargeBtn.layer.cornerRadius = 22
        withdrawBtn.layer.cornerRadius = 22
    }
    
    @IBAction func rechargeAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Mypage", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "RechargeAlert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func withdrawAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Mypage", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "WithdrawAlert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func goMain(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main") as? ViewController {
                vc.modalPresentationStyle = .fullScreen
        
                self.present(vc, animated: true, completion: nil)   // 식별자 가르키는 곳으로 이동
            }
    }
    
}
