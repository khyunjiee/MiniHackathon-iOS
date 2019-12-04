//
//  ViewController.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mypageBtn: UIButton!
    
    var limitCount = 5
    
    
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
        
        mypageBtn.addTarget(self, action: #selector(goToMypage), for: .touchUpInside)
        
    }
    
    
    @IBAction func socksBtnClick(_ sender: UIButton) {
        self.limitCount -= 1
        
        if self.limitCount == 0{
            UIView.animate(withDuration: 0.3, animations: {
                sender.transform = CGAffineTransform(rotationAngle: 18.0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    sender.transform = CGAffineTransform(rotationAngle: -18.0)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        sender.transform = .identity
                    }, completion: { _ in
                        
                            UIView.animate(withDuration: 0.3) {
                                sender.transform = sender.transform.translatedBy(x: 0, y: 100)
                            }
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let myAlert = storyboard.instantiateViewController(identifier: "alert")
                            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                            
                            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                            
                            self.present(myAlert, animated: true, completion: nil)
                        
                        
                    })
                    
                })
            })
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                sender.transform = CGAffineTransform(rotationAngle: 18.0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    sender.transform = CGAffineTransform(rotationAngle: -18.0)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        sender.transform = .identity
                    })
                    
                })
            })
        }
        
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(identifier: "alert")
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    @objc func goToMypage() {
        guard let nextVC = UIStoryboard(name: "Mypage", bundle: nil).instantiateViewController(withIdentifier: "Mypage") as? MypageVC else { return }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
}
