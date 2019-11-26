//
//  ViewController.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.layer.shadowColor = UIColor.black.cgColor
        self.titleLabel.layer.shadowOpacity = 0.3
        self.titleLabel.layer.shadowOffset = .zero
        self.titleLabel.layer.shadowRadius = 10
        
        UIView.animate(withDuration: 1,
        delay: 0,
        options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat],
        animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
          },
        completion: nil)
      
        
        
        
    }
    
    
    @IBAction func socksBtnClick(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            sender.transform = CGAffineTransform(rotationAngle: 18.0)
        }, completion: { _ in
            UIView.animate(withDuration: 0.6, animations: {
                sender.transform = CGAffineTransform(rotationAngle: -18.0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    sender.transform = CGAffineTransform.identity
                })
            })
        })
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(identifier: "alert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(myAlert, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func goMypage(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyPage") as? MypageVC {
                vc.modalPresentationStyle = .fullScreen
        
                self.present(vc, animated: true, completion: nil)   // 식별자 가르키는 곳으로 이동
            }
    }
    
    
}
