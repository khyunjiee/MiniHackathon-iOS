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
    @IBOutlet weak var userPw: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginBtn.makeRounded(cornerRadius: 20.0)
        self.userId.makeRounded(cornerRadius: 18.0)
        self.userPw.makeRounded(cornerRadius: 18.0)
        
        //        loginBtn.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        signupBtn.addTarget(self, action: #selector(goToSignup), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self , selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self)
    }
        @objc func keyboardWillShow(_ notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height/4
                }
            }
        }

        @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    
    
    
    @objc func goToMain() {
        guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? ViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
    @objc func goToSignup() {
        guard let nextVC = UIStoryboard(name: "Signup", bundle: nil).instantiateViewController(withIdentifier: "Signup") as? SignupVC else { return }
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        guard let id = userId.text else { return }
        guard let pwd = userPw.text else { return }
        
        // 싱글톤 패턴이기 때문에 다른 파일이어도 접근 가능
        LoginService.loginShared.login(id, pwd) {
            data in
            
            switch data {
                
            case .success:
                
                guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? ViewController else { return }
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true)
                
            case .requestErr(let message):
                print(message)
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("네트워크 상태를 확인해주세요.")
                
            }
            
        }
        
    }
}
