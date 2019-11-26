//
//  WithdrawAlertVC.swift
//  Sockttery
//
//  Created by 김현지 on 2019/11/27.
//  Copyright © 2019 김현지. All rights reserved.
//

import UIKit

class WithdrawAlertVC: UIViewController {

    @IBOutlet var withdrawBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        withdrawBtn.layer.cornerRadius = 22
    }
    
    @IBAction func dismissPopup(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
