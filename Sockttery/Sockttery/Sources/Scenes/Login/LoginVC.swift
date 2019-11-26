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
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

       

        self.loginBtn.makeRounded(cornerRadius: 20.0)
        self.userId.makeRounded(cornerRadius: 18.0)
        self.userpw.makeRounded(cornerRadius: 18.0)
        
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
    
   

    @IBAction func doLogin(_ sender: UIButton) {
        
        guard let id = userId.text else { return }
        guard let pwd = userpw.text else { return }
        
        LoginService.loginShared.login(id, pwd) {
            data in
            
            switch data {
                
            case .success(let data):
                print(data)
                print("login success")
            case .requestError(let message) :
                print(message)
                break
            case .serverErr:
                print(".serverErr")
            case .pathErr :
                print(".pathErr")
            case .networkFail:
                print(".networkFail")
                break
            }
            
            
        }
        
        
        
        
        
        
    }
    
}
