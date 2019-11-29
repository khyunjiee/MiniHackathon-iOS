//
//  LoginVC.swift
//  Sockttery
//
//  Created by 최은지 on 26/11/2019.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var userpw: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginBtn.makeRounded(cornerRadius: 20.0)
        self.userId.makeRounded(cornerRadius: 18.0)
        self.userpw.makeRounded(cornerRadius: 18.0)
        
        loginBtn.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
    
   

    @objc func goToMain() {
        guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? ViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
        
        
        
        
        
        
    }
    

