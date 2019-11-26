//
//  SignupVC.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/26.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet var userId: UITextField!
    @IBOutlet var userPw: UITextField!
    @IBOutlet var signupBtn: UIButton!
    @IBOutlet var agreeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userId.makeRounded(cornerRadius: 18.5)
        userPw.makeRounded(cornerRadius: 18.5)
        signupBtn.layer.cornerRadius = 22
        agreeView.makeRounded(cornerRadius: 18.5)

    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        guard let userId = userId.text else { return }
        guard let userPw = userPw.text else { return }
        
        SignupService.shared.signup(userId, userPw) {
            data in
            
            switch data {
            case .success(let data):
                let user_data = data as! SignupResponseString
                self.simpleAlert(title: "가입 성공", message: "\(user_data.message)")
                
            case .requestError(let message):
                self.simpleAlert(title: "가입 실패", message: "\(message)")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                self.simpleAlert(title: "가입 실패", message: "네트워크 상태를 확인해주세요.")
            }
        }
    }
    
}
